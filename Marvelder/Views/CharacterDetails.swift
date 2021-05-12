//
//  CharacterDetails.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct CharacterDetails: View {
    @State var character: MarvelCharacter
    var body: some View {
            VStack {
                    VStack {
                        AsyncImage(
                            url: character.thumbnail!.url,
                            placeholder: Text("Loading ...")
                        ).frame(alignment: .top)
                        HStack {
                            Text(character.name ?? "")
                                .font(.title)
                                .bold()
                            Spacer()
                        }.padding(.bottom)
                        Text(character.description ?? "")
                    }.padding(.bottom)
                    VStack {
                        HStack {
                            Text("Comics dispo: 123")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
    //                    List {
    //                        Section {
    //                            Text("hehe")
    //                        }
    //                    }
                    }
                    .background(Color(UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.5)))
                    .cornerRadius(15)
                    .shadow(radius: 20)
            }.edgesIgnoringSafeArea(.top)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: MarvelCharacter(
            id: 5,
            name: "SpiderMan",
            description: "Bitten by a radioactive spider, high school student Peter Parker gained the speed, strength and powers of a spider. Adopting the name Spider-Man, Peter hoped to start a career using his new abilities. Taught that with great power comes great responsibility, Spidey has vowed to use his powers to help people.",
            thumbnail: MarvelImage(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/3/50/526548a343e4b",
                ext: "jpg"
            )
        ))
    }
}

