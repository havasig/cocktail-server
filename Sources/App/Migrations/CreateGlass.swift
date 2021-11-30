//
// Created by havasig on 2021. 11. 07..
//

import Fluent

struct CreateGlass: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.enum("glass")
                .case("Highball glass")
                .case("Cocktail glass")
                .case("Old-fashioned glass")
                .case("Whiskey Glass")
                .case("Collins glass")
                .case("Pousse cafe glass")
                .case("Champagne flute")
                .case("Whiskey sour glass")
                .case("Cordial glass")
                .case("Brandy snifter")
                .case("White wine glass")
                .case("Nick and Nora Glass")
                .case("Hurricane glass")
                .case("Coffee mug")
                .case("Shot glass")
                .case("Jar")
                .case("Irish coffee cup")
                .case("Punch bowl")
                .case("Pitcher")
                .case("Pint glass")
                .case("Copper Mug")
                .case("Wine Glass")
                .case("Beer mug")
                .case("Margarita/Coupette glass")
                .case("Beer pilsner")
                .case("Beer Glass")
                .case("Parfait glass")
                .case("Mason jar")
                .case("Margarita glass")
                .case("Martini Glass")
                .case("Balloon Glass")
                .case("Coupe Glass")
                .create().transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.enum("glass").delete()
    }
}
