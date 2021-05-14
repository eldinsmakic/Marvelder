//
//  MarvelCharacter.swift
//  Marvelder
//
//  Created by eldin smakic on 30/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//
import Foundation

public struct MarvelComic: Codable, Identifiable {

    public let id: Int
    let title: String
    let variantDescription: String
    let description: String
    let thumbnail: MarvelImage?
    let comics: Comics
}

struct Comics: Codable {

    let available: Int?
    let items: [ComicsRessourceItem]?
}

struct ComicsRessourceItem: Codable, Identifiable {

    let resourceURI: String
    let name: String

    public var id: UUID { UUID() }
    var comicId: String? {
        guard let lastSlash = resourceURI.lastIndex(of: "/") else { return nil }

        return String(resourceURI[lastSlash...])
    }
}

public struct MarvelComicCell: Codable, Identifiable {

    public let id: Int
    let title: String
    let description: String?
    let thumbnail: MarvelImage?
}

struct MarvelCharacter: Codable {

    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: MarvelImage?
    let comics: Comics?

//    private enum CodingKeys : String, CodingKey {
//        case id = "id"
//        case name = "name"
//        case description = "description"
//        case thumbnail = "thumbnail"
//        case comics = "comics"
//    }
}

struct MarvelImage: Codable {
    let path: String
    let ext: String

    public init(
        path: String,
        ext: String
    ) {
        self.path = path
        self.ext = ext
    }

    private enum CodingKeys : String, CodingKey {
        case path, ext = "extension"
    }

    var url: URL { return URL(string: "\(path)/standard_xlarge.\(ext)")! }
}

