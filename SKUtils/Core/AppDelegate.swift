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
        let requestExecutor = DefaultRequestExecutor()
        let networkService = DefaultNetworkService(requestExecutor: requestExecutor, errorParser: networkErrorParser)
        let authentificationService = AuthentificationService(networkService: networkService)
        servicesRepository.registerService(service: authentificationService)
        
        // DefaultNetworkService
        let defaultNetworkService = DefaultNetworkService(requestExecutor: requestExecutor, reAuthorizer: authentificationService,
                                                          errorParser: networkErrorParser)
        servicesRepository.registerService(service: defaultNetworkService)
        
        // Other
        let ipDetectingService = IpDetectingService(networkService: defaultNetworkService)
        servicesRepository.registerService(service: ipDetectingService)

        SimpleCoreDataStack.buildAsync(completion: { (stack) in
            let context = stack.importerContext()
            let user = User.create(in: context)
            _ = Mapper<User>().map(JSONObject: ["id": "1234", "name": "Serhii"], toObject: user)
            print(user)
            context.save({ (error) in
                print(error ?? "no error")
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                guard let testUser = User.first(in: stack.mainContext) else { return }
                print(User.count(in: stack.mainContext))
                print(testUser.id ?? "")
            })
        })
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
