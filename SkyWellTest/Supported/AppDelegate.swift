//
//  AppDelegate.swift
//  SkyWellTest
//
//  Created by LEONID NIFANTIJEV on 8/2/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let networkManager: NetworkManager = NetworkManagerFactory.createNetworkManager()
    let persistanceManager: PersistanceManager = PersistanceManagerFactory.createPersistanceManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let module = CarListAssembler().assemble()
        self.window?.rootViewController = UINavigationController(rootViewController: module)
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
    
    
    

   

}

