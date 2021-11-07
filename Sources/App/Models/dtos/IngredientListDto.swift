//
// Created by havasig on 2021. 11. 07..
//

import Foundation
import Vapor
import Fluent

struct IngredientListDto: Codable {
    var ingredients: [String]
}