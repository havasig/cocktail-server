//
// Created by havasig on 2021. 12. 21..
//

import Foundation
import Fluent
import Vapor

struct IngredientController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let ingredients = routes.grouped("ingredient")
        ingredients.get(use: index)
    }

    func index(req: Request) throws -> [Ingredient] {
        Ingredient.allCases
    }
}
