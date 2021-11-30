//
// Created by havasig on 2021. 11. 30..
//

import Foundation
import Vapor
import Fluent

struct SmallDrinkDto: Content {
    var id: Int
    var name: String
    var thumbUrl: String?

    init(id: Int, name: String, thumbUrl: String?) {
        self.id = id
        self.name = name
        self.thumbUrl = thumbUrl
    }
}