//
//  ComicsListView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct ComicsListView: View {
//    @ObservedObject var viewModel = ComicsListViewModel()
    @State var comics: Comics
    var body: some View {
        VStack {
            HStack {
                Text("Comics").font(.title)
                    .padding(.leading, 16)
                Spacer()
            }
            VStack {
                List {
                    ForEach((1...10), id: \.self) { _ in
                        ComicsCellView(id: "viewModel")
                    }
                }
            }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(comics: .init(available: 10, items: []))
    }
}
