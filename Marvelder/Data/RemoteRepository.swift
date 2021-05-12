//
//  RemoteRepository.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Foundation

public protocol RemoteRepositoryProtocol {
    var url: URL { get }

    func get(withId id: String)
    func get(withRessourceURI uri: String)
}


public class RemoteRepositoryMarvel: RemoteRepositoryProtocol {
    public func get(withId id: String) {
        
    }

    public func get(withRessourceURI uri: String) {

    }


    private let shared = RemoteRepositoryMarvel()

    private let privateKey  = "e801f6e96e40567e1d04399061056c0b370f5a52"
    private let publicKey   = "7d94e84bcd551a305b50d27409313edf"
    private let timestamp   = Date().timeIntervalSinceNow.bitPattern
    private let data: String
    private let md5Hex: String

    private init() {
        data = "\(timestamp)\(privateKey)\(publicKey)"
        let hash = MD5(string: data)
        md5Hex = hash.map { String(format: "%02hhx", $0) }.joined()
    }

    public var url: URL {
        URL(string: "https://gateway.marvel.com:443/v1/public/characters?name=Spider-Man&ts=\(timestamp)&apikey=\(publicKey)&hash=\(md5Hex)")!
    }
}
