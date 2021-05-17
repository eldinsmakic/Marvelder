//
//  StoryCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 16/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI

struct StoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        GenericCellView(
            id: "12345",
            viewModel: FakeDataCellViewModel()
        )
            .previewLayout(.sizeThatFits)
    }
}


