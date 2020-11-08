//
//  StatefulTabView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import SwiftUI

enum BuilderType {
    case individual
}

struct StatefulTabView: View {
    private var viewControllers: [UIHostingController<AnyView>] = []
    private var tabBarItems: [Tab] = []

    private var barTintColor: UIColor? = nil
    private var backgroundColor: UIColor? = nil
    private var tabBarConfiguration: TabBarBackgroundConfiguration? = nil

    @State private var stateIndex: Int = 0
    @Binding private var bindableIndex: Int

    private var useBindableIndex: Bool = false

    init(selectedIndex: Binding<Int>? = nil, _ type: BuilderType, _ content: () -> Tab) {
        if let selectedIndex = selectedIndex {
            _bindableIndex = selectedIndex
            useBindableIndex = true
        } else {
            _bindableIndex = .constant(0)
            useBindableIndex = false
        }

        let tabController = UIHostingController(rootView: content().view)
        tabController.tabBarItem = content().barItem
        viewControllers.append(tabController)
    }

    init(selectedIndex: Binding<Int>? = nil, @TabBuilder _ content: () -> [Tab]) {
        if let selectedIndex = selectedIndex {
            _bindableIndex = selectedIndex
            useBindableIndex = true
        } else {
            _bindableIndex = .constant(0)
            useBindableIndex = false
        }

        configureViewControllers(with: content())
    }

    var body: some View {
        TabBarController(controllers: viewControllers,
                         tabBarItems: tabBarItems,
                         barTintColor: barTintColor,
                         backgroundColor: backgroundColor,
                         tabBarConfiguration: tabBarConfiguration,
                         selectedIndex: useBindableIndex ? $bindableIndex : $stateIndex)
            .edgesIgnoringSafeArea(.all)
    }
}

private extension StatefulTabView {
    mutating func configureViewControllers(with tabs: [Tab]) {
        tabs.forEach {
            let tabController = UIHostingController(rootView: $0.view)
            tabController.tabBarItem = $0.barItem
            tabBarItems.append($0)
            viewControllers.append(tabController)
        }
    }
}

@_functionBuilder
struct TabBuilder {
    static func buildBlock(_ children: Tab...) -> [Tab] {
        children
    }
}

extension StatefulTabView {
    func barTintColor(_ color: UIColor) -> StatefulTabView {
        var copy = self
        copy.barTintColor = color
        return copy
    }

    func barBackgroundColor(_ color: UIColor) -> StatefulTabView {
        var copy = self
        copy.backgroundColor = color
        return copy
    }

    func barAppearanceConfiguration(_ configuration: TabBarBackgroundConfiguration) -> StatefulTabView {
        var copy = self
        copy.tabBarConfiguration = configuration
        return copy
    }
}
