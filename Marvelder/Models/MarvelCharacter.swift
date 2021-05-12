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
    let available: Int
    let items: [ComicsRessourceItem]
}

struct ComicsRessourceItem: Codable {
    let ressouceURI: String
    let name: String
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

