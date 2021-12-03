//
// Created by havasig on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

struct AlcoholicController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let alcoholics = routes.grouped("alcoholic")
        alcoholics.get(use: index)
    }

    func index(req: Request) throws -> [Alcoholic] {
        Alcoholic.allCases
    }
}
