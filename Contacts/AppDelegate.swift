//
//  AppDelegate.swift
//  Contacts
//
//  Created by Noah Malmed on 10/25/18.
//  Copyright © 2018 Noah Malmed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: ContactsCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationViewController = UINavigationController()
        self.coordinator = ContactsCoordinator(navigationController: navigationViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        // Pull data
        guard let path = Bundle.main.path(forResource: "employeeDirectory", ofType: "json") else {
            // Handle error
            print("Path to directory JSON not found")
            return true
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let contactList = try JSONDecoder().decode([Contact].self, from: jsonData)
            self.coordinator?.display(page: .list(contacts: contactList))
        }
        catch {
            print(error)
        }
        
        return true
    }

}

