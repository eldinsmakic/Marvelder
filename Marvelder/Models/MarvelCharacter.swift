//
//  MarvelCharacter.swift
//  Marvelder
//
//  Created by eldin smakic on 30/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//
import Foundation

struct MarvelCharacter: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: MarvelImage?
}

struct MarvelImage: Codable {
    let path: String
    let ext: String

    private enum CodingKeys : String, CodingKey {
        case path, ext = "extension"
    }
    
    var url: URL { return URL(string: "\(path)/landscape_xlarge.\(ext)")! }
}
