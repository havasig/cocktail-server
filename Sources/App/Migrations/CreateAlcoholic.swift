//
// Created by havasig on 2021. 11. 04..
//

import Fluent

struct CreateAlcoholic: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.enum("alcoholic")
                .case("Alcoholic")
                .case("NonAlcoholic")
                .case("OptionalAlcohol")
                .create().transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.enum("alcoholic").delete()
    }
}
