//
//  ComicsListView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct ComicsListView: View {
    @State var comics: Comics
    var body: some View {
        VStack {
            HStack {
                Text("Comics")
                    .font(.title)
                    .bold()
                    .padding(.leading, 8)
                Spacer()
            }
            VStack {
                    ForEach(comics.items!) { item in
                        ComicsCellView(id: item.comicId ?? "12345")
                    }
            }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comics: Fake.Comic.comics)
    }
}

