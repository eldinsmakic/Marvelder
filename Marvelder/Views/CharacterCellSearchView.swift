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

struct BlurBG: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
}

struct CharacterCellSearchView: View {

    @State var character: MarvelCharacter

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    AsyncImage(url: character.thumbnail!.url, placeholder: Text("Loading ..."))
                        .cornerRadius(10)
                        .frame(maxWidth: UIScreen.main.bounds.size.width - (8*2),
                               alignment: .center)
                        Text(character.name ?? "no Name").font(.title2)
                            .bold()
                            .frame(maxWidth: UIScreen.main.bounds.size.width - (16*2))
                            .padding()
                            .background(BlurBG())
                }
            }.frame(width: UIScreen.main.bounds.size.width - (16*2), height: UIScreen.main.bounds.size.width, alignment: .center)
            Spacer()
        }
    }
}


struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellSearchView(character: Fake.Character.character)
            .previewLayout(.sizeThatFits)
    }
}


