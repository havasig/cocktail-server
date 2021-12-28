//
// Created by havasig on 2021. 12. 21..
//

import Foundation
import Vapor
import Fluent

final class IngredientListResponseDto: Codable, Content {
    var zero: [Drink] = []
    var one: [Drink] = []
    var two: [Drink] = []
    var three: [Drink] = []
    var more: [Drink] = []
}

