//
//  KeyboardHandler.swift
//  Marvelder
//
//  Created by eldin smakic on 15/05/2021.
//  Copyright © 2021 eldin smakic. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

public final class KeyboardHandler: ObservableObject {

    @Published private(set) var keyboardHeight: CGFloat = 0

    private var cancellable: AnyCancellable?

    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }

    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }

    init() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.self.keyboardHeight, on: self)
    }
}
