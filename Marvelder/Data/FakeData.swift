//
//  FakeData.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

enum Fake {

}

extension Fake {

    enum Comic {

        static let comics = Comics(
            available: 10,
            items: [
            ComicsRessourceItem(
                ressouceURI: "http://gateway.marvel.com/v1/public/comics/62304",
                name: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1"
            ),
            ComicsRessourceItem(
                ressouceURI: "http://gateway.marvel.com/v1/public/comics/78503",
                name: "2099 Alpha (2019) #1"
            ),
            ComicsRessourceItem(
                ressouceURI: "http://gateway.marvel.com/v1/public/comics/60151",
                name: "A YEAR OF MARVELS TPB (Trade Paperback)"
            )
         ])

        static let marvelComicCell = MarvelComicCell(
            id: 4,
            title: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1",
            description: "Spider-Man's Clone Saga has spun completely out of control! There's only one team that can save the wall-crawler now: the Marvel editors! Bob Harras, Ralph Macchio, Tom Brevoort, and more put their heads together to see if ANYTHING can get Spidey out of this doppelganger debacle!",
            thumbnail: MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/9/80/59b3104f67eaf",
                ext: "jpg")
            )
    }
}
