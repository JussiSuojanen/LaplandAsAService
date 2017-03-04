//
//  Resort.swift
//  LaplandAsAService
//
//  Created by Jussi Suojanen on 04/03/2017.
//
//

import Vapor
import HTTP
import Fluent
import Foundation

final class Resort: Model {
    var id: Node?
    var exists: Bool = false
    var name: String
    var height: Int
    var numberOfSlopes: Int
    var numberOfSlopesOpen: Int
    var numberOfLifts: Int
    var numberOfLiftsOpen: Int
    var crossCountrySki: Int
    var defaultImage: String
    var type: Int

    //Convenience init
    init(name: String, height: Int, numberOfSlopes: Int, numberOfSlopesOpen: Int, numberOfLifts: Int, numberOfLiftsOpen: Int, crossCountrySki: Int, defaultImage:String, type: Int) {
        self.name = name
        self.height = height
        self.numberOfSlopes = numberOfSlopes
        self.numberOfSlopesOpen = numberOfSlopesOpen
        self.numberOfLifts = numberOfLifts
        self.numberOfLiftsOpen = numberOfLiftsOpen
        self.crossCountrySki = crossCountrySki
        self.defaultImage = defaultImage
        self.type = type
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        height = try node.extract("height")
        numberOfSlopes = try node.extract("numberOfSlopes")
        numberOfSlopesOpen = try node.extract("numberOfSlopesOpen")
        numberOfLifts = try node.extract("numberOfLifts")
        numberOfLiftsOpen = try node.extract("numberOfLiftsOpen")
        numberOfLifts = try node.extract("numberOfLifts")
        crossCountrySki = try node.extract("crossCountrySki")
        defaultImage = try node.extract("defaultImage")
        type = try node.extract("type")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "height": height,
            "numberOfSlopes": numberOfSlopes,
            "numberOfSlopesOpen": numberOfSlopesOpen,
            "numberOfLifts": numberOfLifts,
            "numberOfLiftsOpen": numberOfLiftsOpen,
            "crossCountrySki": crossCountrySki,
            "defaultImage": defaultImage,
            "type": type
            ])
    }

    static func prepare(_ database: Database) throws {
        try database.create("resorts") { resorts in
            resorts.id()
            resorts.string("name")
            resorts.string("height")
            resorts.string("numberOfSlopes")
            resorts.string("numberOfSlopesOpen")
            resorts.string("numberOfLifts")
            resorts.string("numberOfLiftsOpen")
            resorts.string("crossCountrySki")
            resorts.string("defaultImage")
            resorts.string("type")
        }
    }

    static func revert(_ database: Database) throws {
        try database.delete("resorts")
    }
}
