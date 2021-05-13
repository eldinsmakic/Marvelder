//
//  CharacterDetails.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct CharacterDetailsView: View {
    @State var character: MarvelCharacter
    var body: some View {
        ScrollView(.vertical) {
                    VStack {
                        AsyncImage(
                            url: character.thumbnail!.url,
                            placeholder: Text("Loading ...")
                        ).frame(height: 450, alignment: .top)
                        HStack {
                            Text(character.name ?? "")
                                .font(.title)
                                .bold()
                            Spacer()
                        }.padding([.bottom, .leading , .trailing], 8)

                        Text(character.description ?? "")
                            .padding([.trailing, .leading])

                    }.padding(.bottom, 32)
                    VStack {
                        ComicsListView(comics: character.comics!)
                    }.frame( alignment: .leading)
        }.edgesIgnoringSafeArea(.top)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: MarvelCharacter(
            id: 5,
            name: "SpiderMan",
            description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.",
            thumbnail: MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b",
                ext: "jpg"
            ), comics: Fake.Comic.comics
        ))
    }
}

