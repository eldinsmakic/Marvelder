//
//  ContentView.swift
//  Marvelder
//
//  Created by eldin smakic on 25/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine
import Foundation
import SwiftyJSON

final class PostsViewModel: ObservableObject {
    @Published var posts: [String: Any] = [:]
    @Published var character: MarvelCharacter!
    @Published var isPosted = false

    func fetch() {
        let privateKey = "e801f6e96e40567e1d04399061056c0b370f5a52"
        let publicKey = "7d94e84bcd551a305b50d27409313edf"
        let timestamp = Date().timeIntervalSinceNow.bitPattern


        let data = "\(timestamp)\(privateKey)\(publicKey)"
        print(data)
        let hash = MD5(string: data)

        let md5Hex = hash.map { String(format: "%02hhx", $0) }.joined()
        print("md5Hex: \(md5Hex)")



        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?name=Spider-Man&ts=\(timestamp)&apikey=\(publicKey)&hash=\(md5Hex)")!

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }

                guard let payload = try? JSON(data: data) else { return }
                DispatchQueue.main.async {
                    self.posts = payload.dictionary!
                    guard let data = try? payload["data"]["results"][0].rawData() else { return }
                    print(data)
                    self.character = try? JSONDecoder().decode(MarvelCharacter.self, from: data )
                    print("\(self.character.thumbnail?.path ?? " ")/landscape_xlarge.\(self.character.thumbnail!.ext)")
                    self.isPosted = true
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var post = PostsViewModel()
    var body: some View {
        VStack {
            if self.post.isPosted {
                CharacterDetailsView(character: post.character)
            }
        }.onAppear {
            self.post.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
