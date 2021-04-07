//
//  AppDelegate.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/07.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ArticleListViewController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

