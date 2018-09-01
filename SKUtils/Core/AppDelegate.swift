//
//  AppDelegate.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworkingLib
import SKCustomNavigation
import SKCoreDataStack
import ObjectMapper
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var servicesRepository = ServicesRepository()
    
    private var navControllerDelegate: DefaultNavigationControllerDelegate?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setup(servicesRepository: servicesRepository)
        startApplication()
        return true
    }
    
    // MARK: - Private -
    
    private func setup(servicesRepository: ServicesRepository) {
        // AuthentificationService
        let networkErrorParser = NetworkErrorParser()
        let networkService = DefaultNetworkService(errorParser: networkErrorParser)
        let authentificationService = AuthentificationService(networkService: networkService)
        servicesRepository.registerService(service: authentificationService)
        
        // DefaultNetworkService
        let defaultNetworkService = DefaultNetworkService(reAuthorizer: authentificationService, errorParser: networkErrorParser)
        servicesRepository.registerService(service: defaultNetworkService)
        
        // Other
        let ipDetectingService = IpDetectingService(networkService: defaultNetworkService)
        servicesRepository.registerService(service: ipDetectingService)
    }
    
    private func startApplication() {
        let mainMenuVC = ModuleBuilder.mainMenuModule(servicesRepository: servicesRepository)
        let navigationController = UINavigationController(rootViewController: mainMenuVC)
        navigationController.delegate = delegate(for: navigationController)
        window?.rootViewController = navigationController
    }
    
    private func delegate(for navigationController: UINavigationController) -> DefaultNavigationControllerDelegate? {
        let panInteractionController = PanInteractionController(navigationController: navigationController)
        navControllerDelegate = DefaultNavigationControllerDelegate(with: panInteractionController)
        return navControllerDelegate
    }
    
}
