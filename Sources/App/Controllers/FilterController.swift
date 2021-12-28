//
// Created by havasig on 2021. 11. 07..
//

import Fluent
import Vapor

struct FilterController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let filter = routes.grouped("filter")
        filter.post("ingredients", use: filterByIngredients)

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
    }

    func filterByIngredients(req: Request) async throws -> IngredientListResponseDto {
        let ingredients = try req.content.decode(IngredientListDto.self).ingredients

        let drinks = try await Drink.query(on: req.db).all()

        let result: IngredientListResponseDto = IngredientListResponseDto()

        for drink in drinks {
            for ingredient in ingredients {
                drink.ingredients = drink.ingredients.filter { $0 != ingredient }
            }
            if drink.ingredients.count == 0 {
                result.zero.append(drink)
            } else if drink.ingredients.count == 1 {
                result.one.append(drink)
            } else if drink.ingredients.count == 2 {
                result.two.append(drink)
            } else if drink.ingredients.count == 3 {
                result.three.append(drink)
            } else {
                result.more.append(drink)
            }
        }

        return result
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



    func random(req: Request) async throws -> Drink {
        let ids: [Int] = try await Drink.query(on: req.db).all(\.$dbId)
        let randomInt = Int.random(in: 0..<ids.count)

        return try await Drink.query(on: req.db)
                .filter(\.$dbId == ids[randomInt])
                .first()!
    }



}
