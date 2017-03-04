//
//  ResortController.swift
//  LaplandAsAService
//
//  Created by Jussi Suojanen on 04/03/2017.
//
//

import Vapor
import HTTP
import VaporMySQL

final class ResortController: ResourceRepresentable {

    func index(request: Request) throws -> ResponseRepresentable {
        return try Resort.all().makeNode().converted(to: JSON.self)
    }

    func create(request: Request) throws -> ResponseRepresentable {
        var resort = try request.resort()
        try resort.save()
        return resort
    }

    func makeResource() -> Resource<Resort> {
        return Resource(index: index,
                        store: create)
    }
}

extension Request {
    func resort() throws -> Resort {
        guard let json = json else {
            throw Abort.badRequest
        }

        return try Resort(node: json)
    }
}
