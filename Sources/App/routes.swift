import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    app.get("init") { req -> String in
        let drinkDtoList = try await req
                .client
                .get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")
                .content
                .decode(DrinkDbDtoList.self)
        for drink in drinkDtoList.drinks {
            try await drink.toDrink()
                    .save(on: req.db)
        }
        return "Database filled with data!"
    }

    try app.register(collection: DrinkController())
    try app.register(collection: FilterController())
}
