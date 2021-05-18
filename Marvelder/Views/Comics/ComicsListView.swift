//
//  ComicsListView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI


struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        GenericListView(
            title: "Comics",
            items: Fake.Comic.comics,
            card: {
                item in GenericCellView(
                    id: item.ressourceId!,
                    viewModel: FakeDataCellViewModel()
                )
            }
        )
    }
}

