//
//  Tab.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import SwiftUI

struct Tab {
    private(set) var view: AnyView
    private(set) var barItem: UITabBarItem? = nil

    private(set) var prefersLargeTitle: Bool = false

    let badgeValue: String?

    init<T>(title: String,
                   systemImageName: String,
                   badgeValue: String? = nil,
                   @ViewBuilder content: @escaping () -> T) where T: View {

        self.badgeValue = badgeValue
        barItem = UITabBarItem(title: title, image: UIImage(systemName: systemImageName), selectedImage: nil)

        view = AnyView(content())
    }

    init<T>(title: String,
                   image: UIImage?,
                   selectedImage: UIImage?,
                   badgeValue: String? = nil,
                   @ViewBuilder content: @escaping () -> T) where T: View {

        self.badgeValue = badgeValue
        barItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)

        view = AnyView(content())
    }
}

extension Tab {
    func prefersLargeTitle(_ bool: Bool) -> Tab {
        var copy = self
        copy.prefersLargeTitle = bool
        return copy
    }
}
