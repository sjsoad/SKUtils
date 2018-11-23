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
    
    var defaultNetworkService: NetworkService { get }
    func networkErrorParser() -> ErrorParsable
    func networkService() -> NetworkService
    func authentificationService() -> AuthentificationService
    func ipDetectingService() -> IpDetectingService
    
}

struct DefaultServiceRepository: ServicesRepository {

    static let shared: ServicesRepository = DefaultServiceRepository()
    
    let defaultNetworkService: NetworkService
    
    init() {
        let sessionManager = SessionManager()
        sessionManager.retrier = nil
        sessionManager.adapter = nil
        let requestExecutor = DefaultRequestExecutor(sessionManager: sessionManager)
        let networkService = DefaultNetworkService(requestExecutor: requestExecutor, errorParser: NetworkErrorParser())
        let authService = DefaultAuthentificationService(networkService: networkService)
        defaultNetworkService = DefaultNetworkService(errorParser: NetworkErrorParser())
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
        return DefaultIpDetectingService(networkService: defaultNetworkService)
    }

}
