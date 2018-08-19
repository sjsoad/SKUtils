//
//  AppDelegate.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworkingLib
import Alamofire
import SKCustomNavigation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var servicesRepository = ServicesRepository()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setup(servicesRepository: servicesRepository)
        startApplication()
        return true
    }
    
    // MARK: - Private -
    
    private func setup(servicesRepository: ServicesRepository) {
        let networkErrorParser = NetworkErrorParser()
        let requestExecutor = DefaultRequestExecutor(sessionManager: Alamofire.SessionManager.default, errorParser: networkErrorParser)
        let networkService = DefaultNetworkService(requestExecutor: requestExecutor)
        servicesRepository.registerService(service: networkService)
        let ipDetectingService = IpDetectingService(networkService: networkService)
        servicesRepository.registerService(service: ipDetectingService)
        let authentificationService = AuthentificationService(networkService: networkService)
        servicesRepository.registerService(service: authentificationService)
    }
    
    private func startApplication() {
        let mainMenuVC = ModuleBuilder.mainMenuModule(servicesRepository: servicesRepository)
        let navigationController = UINavigationController(rootViewController: mainMenuVC)
        let panInteractionController = PanInteractionController(navigationController: navigationController)
        navigationController.delegate = DefaultNavigationControllerDelegate(with: panInteractionController)
        window?.rootViewController = navigationController
    }
    
}
