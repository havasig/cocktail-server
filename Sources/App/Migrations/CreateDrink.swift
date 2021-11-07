//
// Created by havasig on 2021. 11. 04..
//

import Fluent

struct CreateDrink: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.enum("alcoholic").read().flatMap { alcoholic in
        database.enum("glass").read().flatMap { glass in
            database.enum("category").read().flatMap { category in
                database.schema("drinks")
                        .id()
                        .field("db_id", .int, .required)
                        .unique(on: "db_id")
                        .field("name", .string, .required)
                        .unique(on: "name")
                        .field("tags", .array(of: .string), .required)
                        .field("video_url", .string)
                        .field("alternate", .string)
                        .field("iba", .string, .required)
                        .field("alcoholic", alcoholic, .required)
                        .field("glass", glass, .required)
                        .field("category", category, .required)
                        .field("instructions", .string)
                        .field("instructions_es", .string)
                        .field("instructions_de", .string)
                        .field("instructions_fr", .string)
                        .field("instructions_it", .string)
                        .field("instructions_zhhans", .string)
                        .field("instructions_zhhant", .string)
                        .field("thumb_url", .string)
                        .field("measures", .array(of: .string), .required)
                        .field("ingredients", .array(of: .string), .required)
                        .field("image_url", .string)
                        .field("image_attribution", .string)
                        .field("confirmed", .bool)
                        .create()
            }
        }
        }
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("drinks").delete()
    }
}
