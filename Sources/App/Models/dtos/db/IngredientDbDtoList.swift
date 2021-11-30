//
// Created by havasig on 2021. 11. 30..
//

import Foundation
import Vapor

struct IngredientDbDtoList: Codable {
    var ingredients: [String]

    enum CodingKeys: String, CodingKey {
        case ingredients = "drinks"
    }
}