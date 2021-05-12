//
//  RemoteRepository.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Foundation
import Combine
import SwiftyJSON

public protocol RemoteRepositoryProtocol {
    associatedtype T

    func get(withId id: String) -> AnyPublisher<T,Error>
//    func get(withRessourceURI uri: String) -> AnyPublisher<T,Error>
//    func getAll() -> AnyPublisher<[T],Error>
}



public class RemoteRepositoryMarvel<T: Decodable >: RemoteRepositoryProtocol {
    private let url: URL
    private let path: String
    private let baseURL = URL(string: "gateway.marvel.com")!

    private let privateKey  = "e801f6e96e40567e1d04399061056c0b370f5a52"
    private let publicKey   = "7d94e84bcd551a305b50d27409313edf"
    private let timestamp   = Date().timeIntervalSinceNow.bitPattern
    private let data: String
    private let md5Hex: String

    init(path: String = "") {
        self.path = path
        data = "\(timestamp)\(privateKey)\(publicKey)"
        let hash = MD5(string: data)
        md5Hex = hash.map { String(format: "%02hhx", $0) }.joined()
        url = baseURL.appendingPathExtension(path)
    }

    public var endURL: URL {
        URL(string: "ts=\(timestamp)&apikey=\(publicKey)&hash=\(md5Hex)")!
    }

    public var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = baseURL.absoluteString

        let queryTS = URLQueryItem(name: "ts", value: "\(timestamp)")
        let queryApiKey = URLQueryItem(name: "apikey", value: publicKey)
        let queryHash = URLQueryItem(name: "hash", value: md5Hex)

        urlComponents.queryItems = [queryTS, queryApiKey, queryHash]

        return urlComponents
    }


    public func get(withId id: String) -> AnyPublisher<T, Error> {
        var urlComponents = urlComponents
        urlComponents.path = "/v1/public/\(self.path)/\(id)"

        return URLSession.shared.dataTaskPublisher(for: urlComponents.url!)
            .tryMap({ (data: Data, response: URLResponse) in
                guard let payload = try? JSON(data: data) else { throw URLError(.unknown)  }
//                    self.posts = payload.dictionary!
                guard let data = try? payload["data"]["results"][0].rawData() else { throw URLError(.unknown) }
                    print(data)
//                    self.character = try? JSONDecoder().decode(MarvelCharacter.self, from: data )
                let value = try JSONDecoder().decode(T.self, from: data) // 4
                return value
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    public func get(withId id: String) {
        print("lke")
    }

    public func get(withRessourceURI uri: String) {

    }
}


public class ComicRepositoryMarvel : RemoteRepositoryMarvel<MarvelComic> {

    public static let shared = ComicRepositoryMarvel()

    private init() {
        super.init(path: "comics")
    }
}

public class ComicCellRepositoryMarvel : RemoteRepositoryMarvel<MarvelComicCell> {

    public static let shared = ComicCellRepositoryMarvel()

    private init() {
        super.init(path: "comics")
    }
}
