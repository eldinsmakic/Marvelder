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
    let digitalId: Int? // The ID of the digital comic representation of this comic. Will be 0 if the comic is not available digitally.,
    let issueNumber: Double? // The number of the issue in the series (will generally be 0 for collection formats).,
    
}

typealias MarvelListT = Codable & Identifiable

class MarvelList<T:MarvelListT>: Codable {

    public let available: Int?
    public let items: [T]?

    init(
        available: Int?,
        items: [T]
    ) {
        self.available = available
        self.items = items
    }
}

class ComicsList: MarvelList<MarvelRessourceItem> {}

class StoryList: MarvelList<MarvelRessourceItem> {}

class EventList: MarvelList<MarvelRessourceItem> {}

class SeriesList: MarvelList<MarvelRessourceItem> {}

struct MarvelRessourceItem: Codable, Identifiable {

    let resourceURI: String
    let name: String

    public var id: UUID { UUID() }

    var ressourceId: String? {
        guard let lastSlash = resourceURI.lastIndex(of: "/") else { return nil }

        var id = resourceURI[lastSlash...]
        id.remove(at: id.startIndex)

        return String(id)
    }
}

public struct MarvelComicCell: Codable, Identifiable {

    public let id: Int
    let title: String
    let description: String?
    let thumbnail: MarvelImage?
}

public struct MarvelStoryCell: Codable, Identifiable {

    public let id: Int
    let title: String
    let description: String?
    let thumbnail: MarvelImage?
}

public struct MarvelCharacter: Codable, Identifiable {

    public let id: Int?
    let name: String?
    let description: String?
    let thumbnail: MarvelImage?
    let comics: ComicsList?
    let stories: StoryList?
    let events: EventList?
    let series: SeriesList?
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

