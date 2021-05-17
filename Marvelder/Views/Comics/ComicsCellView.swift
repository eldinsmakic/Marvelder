//
//  ComicsCellView.swift
//  Marvelder
//
//  Created by eldin smakic on 12/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import SwiftUI
import Combine

struct ComicsCellView_Previews: PreviewProvider {
    static var previews: some View {
        GenericCellView(id: "12345", viewModel: ComicCellViewModel())
            .previewLayout(.sizeThatFits)
    }
}


