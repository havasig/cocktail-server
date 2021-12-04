//
// Created by havasig on 2021. 11. 07..
//

import Fluent
import Vapor

struct FilterController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let filter = routes.grouped("filter")
        filter.group("category") { a in
            a.get(":category", use: getAllByCategory)
        }
        filter.group("glass") { a in
            a.get(":glass", use: getAllByGlass)
        }
        filter.group("name") { a in
            a.get(":name", use: filterByName)
        }
        filter.group("alcoholic") { a in
            a.get(":alcoholic", use: getAllByAlcoholic)
        }
        filter.group("ingredients") { a in
            a.post(use: filterByIngredients)
        }
    }

    func getAllByCategory(req: Request) throws -> EventLoopFuture<[Drink]>{
        let category: String = req.parameters.get("category")!
        guard let category = Category(rawValue: category) else {
            throw Abort(.badRequest)
        }
        return Drink.query(on: req.db)
                .filter(\.$category == category)
                .all()
    }

    func getAllByGlass(req: Request) throws -> EventLoopFuture<[Drink]> {
        let glass: String = req.parameters.get("glass")!
        guard let glass = Glass(rawValue: glass) else {
            throw Abort(.badRequest)
        }
        return Drink.query(on: req.db)
                .filter(\.$glass == glass)
                .all()
    }

    func filterByName(req: Request) throws -> EventLoopFuture<[Drink]> {
        Drink.query(on: req.db)
                .filter(\.$name ~~ req.parameters.get("name")!)
                .all()
    }

    func getAllByAlcoholic(req: Request) throws -> EventLoopFuture<[Drink]> {
        let alcoholic: String = req.parameters.get("alcoholic")!
        guard let alcoholic = Alcoholic(rawValue: alcoholic) else {
            throw Abort(.badRequest)
        }
        return Drink.query(on: req.db)
                .filter(\.$alcoholic == alcoholic)
                .all()
    }

    func filterByIngredients(req: Request) throws -> EventLoopFuture<[Drink]> {
        let ingredients = try req.content.decode(IngredientListDto.self).ingredients

        return Drink.query(on: req.db)
                .field(\._$id)
                .field(\.$ingredients)
                //.filter(\.$ingredients ~~ ["Salt", "Lime juice"])
                .all()
                .flatMap { drinks -> EventLoopFuture<[Drink]> in
                    var ids: [UUID] = []
                    for drink in drinks {
                        if drink.ingredients.filter(ingredients.contains).count == ingredients.count {
                            ids.append(drink.id!)
                        }
                    }
                    return Drink.query(on: req.db)
                            .filter(\.$id ~~ ids)
                            .all()
                }
    }
}
