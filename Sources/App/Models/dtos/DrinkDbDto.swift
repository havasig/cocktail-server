//
// Created by havasig on 2021. 11. 04..
//

import Foundation
import Vapor
import Fluent


struct DrinkDbDto: Codable {
    var idDrink: String?
    var strDrink: String
    var strDrinkAlternate: String?
    var strTags: String
    var strVideo: String?
    var strCategory: String?
    var strIBA: String
    var strAlcoholic: String
    var strGlass: String?
    var strInstructions: String?
    var strInstructionsES: String?
    var strInstructionsDE: String?
    var strInstructionsFR: String?
    var strInstructionsIT: String?
    var strInstructionsZHHANS: String?
    var strInstructionsZHHANT: String?
    var strDrinkThumb: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strImageSource: String?
    var strImageAttribution: String?
    var strCreativeCommonsConfirmed: String
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
        var measures: [String] =
                [strMeasure1, strMeasure2, strMeasure3, strMeasure4,
                 strMeasure5, strMeasure6, strMeasure7, strMeasure8,
                 strMeasure9, strMeasure10, strMeasure11, strMeasure12,
                 strMeasure13, strMeasure14, strMeasure15].compactMap {
                    $0
                }

        for i in 0..<measures.count {
            measures[i] = measures[i].trimmingCharacters(in: .whitespacesAndNewlines)
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
        case idDrink
        case strDrink
        case strDrinkAlternate
        case strTags
        case strVideo
        case strCategory
        case strIBA
        case strAlcoholic
        case strGlass
        case strInstructions
        case strInstructionsES
        case strInstructionsDE
        case strInstructionsFR
        case strInstructionsIT
        case strDrinkThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strImageSource
        case strImageAttribution
        case strCreativeCommonsConfirmed
        case dateModified
    }

}