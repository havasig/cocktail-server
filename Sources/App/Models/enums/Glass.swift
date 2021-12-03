//
// Created by havasig on 2021. 11. 02..
//

import Foundation
import Vapor
import Fluent

enum Glass: String, Codable, CaseIterable, Content {
    case HighballGlass = "Highball glass"
    case CocktailGlass = "Cocktail glass"
    case OldFashionedGlass = "Old-fashioned glass"
    case WhiskeyGlass = "Whiskey Glass"
    case CollinsGlass = "Collins glass"
    case PousseCafeGlass = "Pousse cafe glass"
    case ChampagneFlute = "Champagne flute"
    case WhiskeySourGlass = "Whiskey sour glass"
    case CordialGlass = "Cordial glass"
    case BrandySnifter = "Brandy snifter"
    case WhiteWineGlass = "White wine glass"
    case NickAndNoraGlass = "Nick and Nora Glass"
    case HurricaneGlass = "Hurricane glass"
    case CoffeeMug = "Coffee mug"
    case ShotGlass = "Shot glass"
    case Jar = "Jar"
    case IrishCoffeeCup = "Irish coffee cup"
    case PunchBowl = "Punch bowl"
    case Pitcher = "Pitcher"
    case PintGlass = "Pint glass"
    case CopperMug = "Copper Mug"
    case WineGlass = "Wine Glass"
    case BeerMug = "Beer mug"
    case MargaritaCoupetteGlass = "Margarita/Coupette glass"
    case BeerPilsner = "Beer pilsner"
    case BeerGlass = "Beer Glass"
    case ParfaitGlass = "Parfait glass"
    case MasonJar = "Mason jar"
    case MargaritaGlass = "Margarita glass"
    case MartiniGlass = "Martini Glass"
    case BalloonGlass = "Balloon Glass"
    case CoupeGlass = "Coupe Glass"
}
