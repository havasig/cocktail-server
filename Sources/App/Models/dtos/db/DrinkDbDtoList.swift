//
// Created by havasig on 2021. 11. 30..
//

import Foundation
import Vapor
import Fluent

struct DrinkDbDtoList: Codable {
    var drinks: [DrinkDbDto]

    enum CodingKeys: String, CodingKey {
        case drinks
    }
}