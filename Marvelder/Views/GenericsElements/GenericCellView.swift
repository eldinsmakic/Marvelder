//
//  GenericCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 17/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct GenericCellView: View {

    let id: String

    @ObservedObject var viewModel: GenericCellViewModel

    var body: some View {
            GeometryReader { geo in
                if viewModel.itemCell != nil {
                    VStack {
                        Text(viewModel.itemCell!.title).font(.title3)
                            .lineLimit(2)
                            .padding([.leading, .bottom, .trailing], 8)
                            .frame(height: 90, alignment: .bottom)

                        HStack {
                            AsyncImage(url: viewModel.itemCell!.thumbnail?.url, placeholder: Text("Loading ..."))
                                    .frame(width: geo.size.width/3 , alignment: .center)
                            Text(viewModel.itemCell!.description ?? "No description").font(.body)
                                .padding(.trailing)
                                .frame(alignment: .bottom)
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.size.width - (8*2), height: 220, alignment: .center)
            .onAppear(perform: { viewModel.getData(fromId: id) })
    }
}

struct GenericCellView_Previews: PreviewProvider {
    static var previews: some View {
        GenericCellView(id: "12345", viewModel: FakeDataCellViewModel())
    }
}
