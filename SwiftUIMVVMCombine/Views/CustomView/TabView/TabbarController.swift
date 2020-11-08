//
//  TabbarController.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/8/20.
//

import Foundation
import SwiftUI

enum TabBarBackgroundConfiguration {
    case `default`
    case opaque
    case transparent
}

struct TabBarController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    var tabBarItems: [Tab]

    var barTintColor: UIColor?
    var backgroundColor: UIColor?
    var tabBarConfiguration: TabBarBackgroundConfiguration?

    @Binding var selectedIndex: Int

    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = context.coordinator
        tabBarController.selectedIndex = selectedIndex

        configure(tabBarController.tabBar)
        return tabBarController
    }

    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        tabBarController.selectedIndex = selectedIndex

        tabBarItems.forEach { tab in
            guard let index = tabBarItems.firstIndex(where: { $0.barItem == tab.barItem }), let controllers = tabBarController.viewControllers else { return }

            if controllers.indices.contains(index) {
                controllers[index].tabBarItem.badgeValue = tab.badgeValue
            }
        }
    }

    func makeCoordinator() -> TabBarCoordinator {
        TabBarCoordinator(self)
    }
}

private extension TabBarController {
    func configure(_ tabBar: UITabBar) {
        let appearance = tabBar.standardAppearance.copy()

        if let config = tabBarConfiguration {
            switch config {
            case .default:
                appearance.configureWithDefaultBackground()
            case .opaque:
                appearance.configureWithOpaqueBackground()
            case .transparent:
                appearance.configureWithTransparentBackground()
            }
        }

        if let barTintColor = barTintColor {
            tabBar.tintColor = barTintColor
        }

        if let backgroundColor = backgroundColor {
            tabBar.backgroundColor = backgroundColor
        }

        tabBar.standardAppearance = appearance
    }

    func navigationController(in viewController: UIViewController) -> UINavigationController? {
        var controller: UINavigationController?

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        viewController.children.forEach {
            if let navigationController = $0 as? UINavigationController {
                controller = navigationController
            } else {
                controller = navigationController(in: $0)
            }
        }

        return controller
    }
}
