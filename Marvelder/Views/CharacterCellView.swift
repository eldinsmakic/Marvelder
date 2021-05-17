//
//  CharacterCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 15/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine

final class ChacaterCellViewModel: ObservableObject {

    let repo = ComicCellRepositoryMarvel.shared

    @Published var comicCell = Fake.Comic.marvelComicCell
    @Published var isLoad = false

    var cancellationToken: AnyCancellable?

    public func getData(fromId id: String) {
        cancellationToken = repo.get(withId: id)
            .sink { error in
                print(error)
        } receiveValue: { data in
            self.comicCell = data
            self.isLoad = true
        }
    }
}

struct CharacterCellView: View {

    @State var character: MarvelCharacter

    var body: some View {
        GeometryReader { geo in
            HStack {
                AsyncImage(url: character.thumbnail!.url, placeholder: Text("Loading ..."))
                    .frame(minWidth: geo.size.width/3, idealWidth: nil, maxWidth: nil, minHeight: nil, idealHeight: nil, maxHeight: 200, alignment: .center)
                    VStack {
                        Text(character.name ?? "no Name").font(.title3)
                            .lineLimit(2)
                            .padding([.trailing, .bottom], 8)
                        Text(character.description ?? "No description").font(.body)
                            .foregroundColor(.gray)
                    }
                }
        }.frame(width: UIScreen.main.bounds.size.width - (8*2), height: 200, alignment: .center)
    }
}


struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(character: Fake.Character.character)
            .previewLayout(.sizeThatFits)
    }
}


