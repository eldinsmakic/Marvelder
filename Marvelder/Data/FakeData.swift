//
//  FakeData.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

enum Fake {}

extension Fake {

    enum Character {

        static let character = MarvelCharacter(
            id: 5,
            name: "SpiderMan",
            description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.",
            thumbnail: MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b",
                ext: "jpg"
            ),
            comics: Fake.Comic.comics,
            stories: Fake.Story.storys
        )
    }
}

extension Fake {

    enum Comic {

        static let comics = ComicsList(
            available: 10,
            items: [
                MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/62304",
                    name: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1"
                ),
                    MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/78503",
                    name: "2099 Alpha (2019) #1"
                ),
                    MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/60151",
                    name: "A YEAR OF MARVELS TPB (Trade Paperback)"
                )
         ]
        )

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


extension Fake {

    enum Story {

        static let storys = StoryList(
            available: 10,
            items: [
                MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/62304",
                    name: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1"
                ),
                    MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/78503",
                    name: "2099 Alpha (2019) #1"
                ),
                    MarvelRessourceItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/60151",
                    name: "A YEAR OF MARVELS TPB (Trade Paperback)"
                )
            ]
        )

        static let storyCell = MarvelStoryCell(
            id: 4,
            title: "Spider-Man: 101 Ways to End the Clone Saga (1997) #1",
            description: "Spider-Man's Clone Saga has spun completely out of control! There's only one team that can save the wall-crawler now: the Marvel editors! Bob Harras, Ralph Macchio, Tom Brevoort, and more put their heads together to see if ANYTHING can get Spidey out of this doppelganger debacle!",
            thumbnail: MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/9/80/59b3104f67eaf",
                ext: "jpg")
            )
    }
}
