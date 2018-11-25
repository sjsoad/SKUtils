//
//  DefaultServiceRepository.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Alamofire
import SKNetworkingLib

protocol ServicesRepository {
    
    var mainNetworkService: NetworkService { get }
    func networkErrorParser() -> ErrorParsable
    func networkService() -> NetworkService
    func authentificationService() -> AuthentificationService
    func ipDetectingService() -> IpDetectingService
    
}

struct DefaultServiceRepository: ServicesRepository {

    static let shared: ServicesRepository = DefaultServiceRepository()
    
    let mainNetworkService: NetworkService
    
    init() {
        // Create simple network service for refreshing token
        let simpleNetworkService = DefaultNetworkService(errorParser: NetworkErrorParser())
        // Create service for storing auth credentials and refreshing token
        let authService = DefaultAuthentificationService(networkService: simpleNetworkService)
        // Create new SessionManager
        let sessionManager = SessionManager()
        // Set retrier and/or adapter
        sessionManager.retrier = DefaultRequestRetrier(with: authService)
        sessionManager.adapter = DefaultRequestAdapter(with: authService)
        // Create new service with advanced SessionManager
        mainNetworkService = DefaultNetworkService(with: sessionManager, errorParser: NetworkErrorParser())
    }
    
    func networkErrorParser() -> ErrorParsable {
        return NetworkErrorParser()
    }
    
    func networkService() -> NetworkService {
        return DefaultNetworkService(errorParser: networkErrorParser())
    }
    
    func authentificationService() -> AuthentificationService {
        return DefaultAuthentificationService(networkService: networkService())
    }
    
    func ipDetectingService() -> IpDetectingService {
        return DefaultIpDetectingService(networkService: mainNetworkService)
    }

}
