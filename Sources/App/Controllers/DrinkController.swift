//
// Created by havasig on 2021. 11. 04..
//

import Fluent
import Vapor

struct DrinkController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let drinks = routes.grouped("drinks")
        drinks.get(use: index)
        drinks.post(use: create)
        drinks.post("db", use: createFromDb)
        drinks.post("db", use: createFromDb)
        drinks.group(":drinkID") { drink in
            drink.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Drink]> {
        Drink.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Drink> {
        let drink = try req.content.decode(Drink.self)
        return drink.save(on: req.db).map {
            drink
        }
    }

    func createFromDb(req: Request) throws -> EventLoopFuture<Drink> {
        let drinkDto = try req.content.decode(DrinkDbDto.self)
        let drink = drinkDto.toDrink()
        return drink.save(on: req.db).map {
            drink
        }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        Drink.find(req.parameters.get("drinkID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap {
                    $0.delete(on: req.db)
                }
                .transform(to: .ok)
    }
}
