//
// Created by havasig on 2021. 11. 02..
//

import Foundation
import Vapor
import Fluent

enum Category: String, Codable, CaseIterable, Content {
    case OrdinaryDrink = "Ordinary Drink"
    case Cocktail = "Cocktail"
    case MilkFloatShake = "Milk / Float / Shake"
    case OtherUnknown = "Other/Unknown"
    case Cocoa = "Cocoa"
    case Shot = "Shot"
    case CoffeeTea = "Coffee / Tea"
    case HomemadeLiqueur = "Homemade Liqueur"
    case PunchPartyDrink = "Punch / Party Drink"
    case Beer = "Beer"
    case SoftDrinkSoda = "Soft Drink / Soda"
}
