//
// Created by havasig on 2021. 12. 03..
//

import Foundation
import Fluent
import Vapor

struct GlassController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let glasses = routes.grouped("glass")
        glasses.get(use: index)
    }

    func index(req: Request) throws -> [Glass] {
        Glass.allCases
    }
}
