//
// Created by havasig on 2021. 11. 04..
//

import Fluent
import Vapor

struct DrinkController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let drinks = routes.grouped("drink")
        drinks.get("all", use: index)
        drinks.get("top10", use: top10)
        drinks.get("random", use: random)
        drinks.post(use: create)
        drinks.group(":drinkID") { drink in
            drink.delete(use: delete)
            drink.get(use: getById)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Drink]> {
        Drink.query(on: req.db).all()
    }

    func random(req: Request) async throws -> Drink {
        let ids: [Int] = try await Drink.query(on: req.db).all(\.$dbId)
        let randomInt = Int.random(in: 0..<ids.count)

        return try await Drink.query(on: req.db)
                .filter(\.$dbId == ids[randomInt])
                .first()!
    }

    func top10(req: Request) throws -> EventLoopFuture<[Drink]> {
        Drink.query(on: req.db)
                .filter(\.$dbId ~~
                        [11000, 11001, 11002, 11003, 11004,
                         11005, 11006, 11007, 11008, 11009])
                .all()
    }

    func create(req: Request) throws -> EventLoopFuture<Drink> {
        let drink = try req.content.decode(Drink.self)
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

    func getById(req: Request) async throws -> Drink {
        guard let drinkId = req.parameters.get("drinkID") else {
            throw Abort(.badRequest)
        }
        guard let id = Int(drinkId) else {
            throw Abort(.badRequest)
        }

        let drink = try await Drink.query(on: req.db)
                .filter(\.$dbId == id)
                .first()

        if drink != nil {
            return drink!
        } else {
            throw Abort(.notFound)
        }
    }
}
