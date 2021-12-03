//
// Created by havasig on 2021. 11. 02..
//

import Foundation
import Vapor
import Fluent

enum Alcoholic: String, Codable, CaseIterable, Content {
    case Alcoholic = "Alcoholic"
    case NonAlcoholic = "Non alcoholic"
    case OptionalAlcohol = "Optional alcohol"
}