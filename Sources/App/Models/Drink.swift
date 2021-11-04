//
// Created by havasig on 2021. 11. 02..
//

import Foundation
import Vapor
import Fluent

final class Drink: Model, Content {
    static let schema = "drinks"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "db_id")
    var dbId: Int

    @Field(key: "name")
    var name: String


    @Field(key: "tags")
    var tags: [String]

    @Field(key: "video_url")
    var videoUrl: String?

    /*

    @Field(key: "alternate")
    var alternate: Drink?

    @Field(key: "category")
    var category: Category

    @Field(key: "glass")
    var glass: Glass



    @Field(key: "dateModified")
    var dateModified: String?
     */

    @Field(key: "iba")
    var iba: String

    @Enum(key: "alcoholic")
    var alcoholic: Alcoholic

    @Field(key: "instructions")
    var instructions: String?

    @Field(key: "instructions_es")
    var instructionsES: String?

    @Field(key: "instructions_de")
    var instructionsDE: String?

    @Field(key: "instructions_fr")
    var instructionsFR: String?

    @Field(key: "instructions_it")
    var instructionsIT: String?

    @Field(key: "instructions_zhhans")
    var instructionsZHHANS: String?

    @Field(key: "instructions_zhhant")
    var instructionsZHHANT: String?

    @Field(key: "thumb_url")
    var thumbUrl: String?

    @Field(key: "ingredients")
    var ingredients: [String]

    @Field(key: "measures")
    var measures: [String]

    @Field(key: "image_url")
    var imageUrl: String?

    @Field(key: "image_attribution")
    var imageAttribution: String?

    @Field(key: "confirmed")
    var confirmed: Bool?

    init() {
    }
}