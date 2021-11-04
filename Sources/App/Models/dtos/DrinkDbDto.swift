//
// Created by havasig on 2021. 11. 04..
//

import Foundation
import Vapor
import Fluent


final class DrinkDbDto: Model, Content {
    static let schema = "asd"

    init() {

    }

    @ID(key: .id)
    var id: UUID?

    @Field(key: "idDrink")
    var idDrink: String?

    @Field(key: "strDrink")
    var strDrink: String

    @Field(key: "strDrinkAlternate")
    var strDrinkAlternate: String?

    @Field(key: "strTags")
    var strTags: String

    @Field(key: "strVideo")
    var strVideo: String?

    @Field(key: "strCategory")
    var strCategory: String?

    @Field(key: "strIBA")
    var strIBA: String

    @Field(key: "strAlcoholic")
    var strAlcoholic: String

    @Field(key: "strGlass")
    var strGlass: String?

    @Field(key: "strInstructions")
    var strInstructions: String?

    @Field(key: "strInstructionsES")
    var strInstructionsES: String?

    @Field(key: "strInstructionsDE")
    var strInstructionsDE: String?

    @Field(key: "strInstructionsFR")
    var strInstructionsFR: String?

    @Field(key: "strInstructionsIT")
    var strInstructionsIT: String?

    @Field(key: "strInstructionsZHHANS")
    var strInstructionsZHHANS: String?

    @Field(key: "strInstructionsZHHANT")
    var strInstructionsZHHANT: String?

    @Field(key: "strDrinkThumb")
    var strDrinkThumb: String?

    @Field(key: "strIngredient1")
    var strIngredient1: String?

    @Field(key: "strIngredient2")
    var strIngredient2: String?

    @Field(key: "strIngredient3")
    var strIngredient3: String?

    @Field(key: "strIngredient4")
    var strIngredient4: String?

    @Field(key: "strIngredient5")
    var strIngredient5: String?

    @Field(key: "strIngredient6")
    var strIngredient6: String?

    @Field(key: "strIngredient7")
    var strIngredient7: String?

    @Field(key: "strIngredient8")
    var strIngredient8: String?

    @Field(key: "strIngredient9")
    var strIngredient9: String?

    @Field(key: "strIngredient10")
    var strIngredient10: String?

    @Field(key: "strIngredient11")
    var strIngredient11: String?

    @Field(key: "strIngredient12")
    var strIngredient12: String?

    @Field(key: "strIngredient13")
    var strIngredient13: String?

    @Field(key: "strIngredient14")
    var strIngredient14: String?

    @Field(key: "strIngredient15")
    var strIngredient15: String?

    @Field(key: "strMeasure1")
    var strMeasure1: String?

    @Field(key: "strMeasure2")
    var strMeasure2: String?

    @Field(key: "strMeasure3")
    var strMeasure3: String?

    @Field(key: "strMeasure4")
    var strMeasure4: String?

    @Field(key: "strMeasure5")
    var strMeasure5: String?

    @Field(key: "strMeasure6")
    var strMeasure6: String?

    @Field(key: "strMeasure7")
    var strMeasure7: String?

    @Field(key: "strMeasure8")
    var strMeasure8: String?

    @Field(key: "strMeasure9")
    var strMeasure9: String?

    @Field(key: "strMeasure10")
    var strMeasure10: String?

    @Field(key: "strMeasure11")
    var strMeasure11: String?

    @Field(key: "strMeasure12")
    var strMeasure12: String?

    @Field(key: "strMeasure13")
    var strMeasure13: String?

    @Field(key: "strMeasure14")
    var strMeasure14: String?

    @Field(key: "strMeasure15")
    var strMeasure15: String?

    @Field(key: "strImageSource")
    var strImageSource: String?

    @Field(key: "strImageAttribution")
    var strImageAttribution: String?

    @Field(key: "strCreativeCommonsConfirmed")
    var strCreativeCommonsConfirmed: String

    @Field(key: "dateModified")
    var dateModified: String?

    func toDrink() -> Drink {
        let drink = Drink()
        let tags = strTags.components(separatedBy: ",")

        let ingredients: [String] =
                [strIngredient1, strIngredient2, strIngredient3, strIngredient4,
                 strIngredient5, strIngredient6, strIngredient7, strIngredient8,
                 strIngredient9, strIngredient10, strIngredient11, strIngredient12,
                 strIngredient13, strIngredient14, strIngredient15].compactMap {
                    $0
                }
        let measures: [String] =
                [strMeasure1, strMeasure2, strMeasure3, strMeasure4,
                 strMeasure5, strMeasure6, strMeasure7, strMeasure8,
                 strMeasure9, strMeasure10, strMeasure11, strMeasure12,
                 strMeasure13, strMeasure14, strMeasure15].compactMap {
                    $0
                }

        var isConfirmed: Bool? = nil
        switch strCreativeCommonsConfirmed.lowercased() {
        case "yes":
            isConfirmed = true
        default:
            isConfirmed = false
        }

        drink.dbId = Int(idDrink!)!;
        drink.name = strDrink;
        //drink.alternate = strDrinkAlternate;
        drink.tags = tags;
        drink.videoUrl = strVideo;
        //drink.category = strCategory;
        drink.iba = strIBA;
        drink.alcoholic = Alcoholic(rawValue: strAlcoholic)!
        //drink.glass = Glass(rawValue: strGlass)!
        drink.instructions = strInstructions
        drink.instructionsES = strInstructionsES
        drink.instructionsDE = strInstructionsDE
        drink.instructionsFR = strInstructionsFR
        drink.instructionsIT = strInstructionsIT
        drink.instructionsZHHANS = strInstructionsZHHANS
        drink.instructionsZHHANT = strInstructionsZHHANT
        drink.thumbUrl = strDrinkThumb
        drink.ingredients = ingredients
        drink.measures = measures
        drink.imageUrl = strImageSource
        drink.imageAttribution = strImageAttribution
        drink.confirmed = isConfirmed

        return drink
    }

    enum CodingKeys: String, CodingKey {
        case strInstructionsZHHANS = "strInstructionsZH-HANS"
        case strInstructionsZHHANT = "strInstructionsZH-HANT"
    }

    init(id: UUID?, idDrink: String?, strDrink: String, strDrinkAlternate: String?, strTags: String, strVideo: String?, strCategory: String?, strIBA: String, strAlcoholic: String, strGlass: String?, strInstructions: String?, strInstructionsES: String?, strInstructionsDE: String?, strInstructionsFR: String?, strInstructionsIT: String?, strInstructionsZHHANS: String?, strInstructionsZHHANT: String?, strDrinkThumb: String?, strIngredient1: String?, strIngredient2: String?, strIngredient3: String?, strIngredient4: String?, strIngredient5: String?, strIngredient6: String?, strIngredient7: String?, strIngredient8: String?, strIngredient9: String?, strIngredient10: String?, strIngredient11: String?, strIngredient12: String?, strIngredient13: String?, strIngredient14: String?, strIngredient15: String?, strMeasure1: String?, strMeasure2: String?, strMeasure3: String?, strMeasure4: String?, strMeasure5: String?, strMeasure6: String?, strMeasure7: String?, strMeasure8: String?, strMeasure9: String?, strMeasure10: String?, strMeasure11: String?, strMeasure12: String?, strMeasure13: String?, strMeasure14: String?, strMeasure15: String?, strImageSource: String?, strImageAttribution: String?, strCreativeCommonsConfirmed: String, dateModified: String?) {
        self.id = id
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkAlternate = strDrinkAlternate
        self.strTags = strTags
        self.strVideo = strVideo
        self.strCategory = strCategory
        self.strIBA = strIBA
        self.strAlcoholic = strAlcoholic
        self.strGlass = strGlass
        self.strInstructions = strInstructions
        self.strInstructionsES = strInstructionsES
        self.strInstructionsDE = strInstructionsDE
        self.strInstructionsFR = strInstructionsFR
        self.strInstructionsIT = strInstructionsIT
        self.strInstructionsZHHANS = strInstructionsZHHANS
        self.strInstructionsZHHANT = strInstructionsZHHANT
        self.strDrinkThumb = strDrinkThumb
        self.strIngredient1 = strIngredient1
        self.strIngredient2 = strIngredient2
        self.strIngredient3 = strIngredient3
        self.strIngredient4 = strIngredient4
        self.strIngredient5 = strIngredient5
        self.strIngredient6 = strIngredient6
        self.strIngredient7 = strIngredient7
        self.strIngredient8 = strIngredient8
        self.strIngredient9 = strIngredient9
        self.strIngredient10 = strIngredient10
        self.strIngredient11 = strIngredient11
        self.strIngredient12 = strIngredient12
        self.strIngredient13 = strIngredient13
        self.strIngredient14 = strIngredient14
        self.strIngredient15 = strIngredient15
        self.strMeasure1 = strMeasure1
        self.strMeasure2 = strMeasure2
        self.strMeasure3 = strMeasure3
        self.strMeasure4 = strMeasure4
        self.strMeasure5 = strMeasure5
        self.strMeasure6 = strMeasure6
        self.strMeasure7 = strMeasure7
        self.strMeasure8 = strMeasure8
        self.strMeasure9 = strMeasure9
        self.strMeasure10 = strMeasure10
        self.strMeasure11 = strMeasure11
        self.strMeasure12 = strMeasure12
        self.strMeasure13 = strMeasure13
        self.strMeasure14 = strMeasure14
        self.strMeasure15 = strMeasure15
        self.strImageSource = strImageSource
        self.strImageAttribution = strImageAttribution
        self.strCreativeCommonsConfirmed = strCreativeCommonsConfirmed
        self.dateModified = dateModified
    }
}