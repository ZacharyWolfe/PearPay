//
//  Utilities.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import Foundation
import UIKit


final class Utilities{
    static let shared = Utilities()

    private init(){}

    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) {

            let window = windowScene.windows.first
            var topController = controller ?? window?.rootViewController

            while let presentedController = topController?.presentedViewController {
                topController = presentedController
            }

            if let navigationController = topController as? UINavigationController {
                return navigationController.visibleViewController
            }

            if let tabBarController = topController as? UITabBarController {
                if let selectedViewController = tabBarController.selectedViewController {
                    return topViewController(controller: selectedViewController)
                }
            }
            
            return topController
        }
        return nil
    }
}
