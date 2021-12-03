//
// Created by havasig on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

struct CategoryController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let categories = routes.grouped("category")
        categories.get(use: index)
    }

    func index(req: Request) throws -> [Category] {
        Category.allCases
    }
}
