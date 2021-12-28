//
// Created by havasig on 2021. 11. 02..
//

import Foundation
import Vapor
import Fluent

enum Ingredient: String, Codable, CaseIterable, Content {
    case Applejack = "Applejack"
    case Gin = "Gin"
    case Scotch = "Scotch"
    case Brandy = "Brandy"
    case LightRum = "Light rum"
    case DarkRum = "Dark rum"
    case SweetVermouth = "Sweet Vermouth"
    case StrawberrySchnapps = "Strawberry schnapps"
    case ApricotBrandy = "Apricot brandy"
    case TripleSec = "Triple sec"
    case SouthernComfort = "Southern Comfort"
    case OrangeBitters = "Orange bitters"
    case LemonVodka = "Lemon vodka"
    case BlendedWhiskey = "Blended whiskey"
    case DrVermouth = "Dry Vermouth"
    case Amaretto = "Amaretto"
    case Tea = "Tea"
    case Champagne = "Champagne"
    case CoffeeLiqueur = "Coffee liqueur"
    case Bourbon = "Bourbon"
    case Tequila = "Tequila"
    case Vodka = "Vodka"
    case AnejoRum = "Añejo rum"
    case Bitters = "Bitters"
    case Sugar = "Sugar"
    case Kahlua = "Kahlua"
    case demeraraSugar = "demerara Sugar"
    case DubonnetRouge = "Dubonnet Rouge"
    case Watermelon = "Watermelon"
    case LimeJuice = "Lime juice"
    case IrishWhiskey = "Irish whiskey"
    case AppleBrandy = "Apple brandy"
    case CarbonatedWater = "Carbonated water"
    case CherryBrandy = "Cherry brandy"
    case CremeDeCacao = "Creme de Cacao"
    case Grenadine = "Grenadine"
    case Port = "Port"
    case CoffeeBrandy = "Coffee brandy"
    case RedWine = "Red wine"
    case Rum = "Rum"
    case GrapefruitJuice = "Grapefruit juice"
    case Ricard = "Ricard"
    case Sherry = "Sherry"
    case Cognac = "Cognac"
    case SloeGin = "Sloe gin"
    case AppleJuice = "Apple juice"
    case PineappleJuice = "Pineapple juice"
    case LemonJuice = "Lemon juice"
    case SugarSyrup = "Sugar syrup"
    case Milk = "Milk"
    case Strawberries = "Strawberries"
    case ChocolateSyrup = "Chocolate syrup"
    case Yoghurt = "Yoghurt"
    case Mango = "Mango"
    case Ginger = "Ginger"
    case Lime = "Lime"
    case Cantaloupe = "Cantaloupe"
    case Berries = "Berries"
    case Grapes = "Grapes"
    case Kiwi = "Kiwi"
    case TomatoJuice = "Tomato juice"
    case CocoaPowder = "Cocoa powder"
    case Chocolate = "Chocolate"
    case HeavyCream = "Heavy cream"
    case Galliano = ""
    case PeachVodka = "Peach Vodka"
    case Ouzo = "Ouzo"
    case Coffee = "Coffee"
    case SpicedRum = "Spiced rum"
    case Water = "Water"
    case Espresso = "Espresso"
    case AngelicaRoot = "Angelica root"
    case Orange = "Orange"
    case Cranberries = "Cranberries"
    case JohnnieWalker = "Johnnie Walker"
    case AppleCider = "Apple cider"
    case Everclear = "Everclear"
    case CranberryJuice = "Cranberry juice"
    case EggYolk = "Egg yolk"
    case Egg = "Egg"
    case GrapeJuice = "Grape juice"
    case PeachNectar = "Peach nectar"
    case Lemon = "Lemon"
    case Firewater = "Firewater"
    case Lemonade = "Lemonade"
    case Lager = "Lager"
    case Whiskey = "Whiskey"
    case AbsolutCitron = "Absolut Citron"
    case Pisco = "Pisco"
    case IrishCream = "Irish cream"
    case Ale = "Ale"
    case ChocolateLiqueur = "Chocolate liqueur"
    case MidoriMelonLiqueur = "Midori melon liqueur"
    case Sambuca = "Sambuca"
    case Cider = "Cider"
    case Sprite = "Sprite"
    case SevenUp = "7-Up"
    case BlackberryBrandy = "Blackberry brandy"
    case PeppermintSchnapps = "Peppermint schnapps"
    case CremeDeCassis = "Creme de Cassis"
}
