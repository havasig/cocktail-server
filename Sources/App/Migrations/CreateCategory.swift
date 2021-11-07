//
// Created by havasig on 2021. 11. 07..
//

import Fluent

struct CreateCategory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.enum("category")
                .case("Ordinary Drink")
                .case("Cocktail")
                .case("Milk / Float / Shake")
                .case("Other/Unknown")
                .case("Cocoa")
                .case("Shot")
                .case("Coffee / Tea")
                .case("Homemade Liqueur")
                .case("Punch / Party Drink")
                .case("Beer")
                .case("Soft Drink / Soda")
                .create().transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.enum("category").delete()
    }
}
