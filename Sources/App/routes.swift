import Fluent
import Vapor

func routes(_ app: Application) throws {
    var databaseInitialized = false
    app.get { req in
        "It works!"
    }

    app.get("init-db") { req -> String in
        if(databaseInitialized) {
            return "Database already initialized"
        }
        for char in "1234567890abcdefghijklmnopqrstuvwxyz" {
            do {
                let drinkDtoList = try await req
                        .client
                        .get("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(char)")
                        .content
                        .decode(DrinkDbDtoList.self)

                for drink in drinkDtoList.drinks {
                    do {
                        try await drink.toDrink()
                                .save(on: req.db)
                    } catch {
                        if let drinkId = drink.idDrink {
                            print("Drink with id \(drinkId) is duplicated")
                        } else {
                            print("No idea, what is going on")
                        }
                    }
                }
            } catch {
                print("There are no cocktails with letter \(char)")
            }

        }
        databaseInitialized = true
        return "Database filled with data"
    }

    try app.register(collection: DrinkController())
    try app.register(collection: FilterController())
    try app.register(collection: GlassController())
    try app.register(collection: CategoryController())
    try app.register(collection: AlcoholicController())
    try app.register(collection: IngredientController())
}
