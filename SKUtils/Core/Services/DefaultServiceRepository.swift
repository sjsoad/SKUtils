//
//  DefaultServiceRepository.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworkingLib

protocol ServicesRepository {
    
    var defaultNetworkService: NetworkService { get }
    func networkErrorParser() -> ErrorParsable
    func networkService(with reAuthorizer: ReAuthorizable?) -> NetworkService
    func authentificationService() -> ReAuthorizable
    func ipDetectingService() -> IpDetectingService
    
}

struct DefaultServiceRepository: ServicesRepository {

    static let shared: ServicesRepository = DefaultServiceRepository()
    
    let defaultNetworkService: NetworkService
    
    init() {
        let networkService = DefaultNetworkService(errorParser: NetworkErrorParser())
        let authService = AuthentificationService(networkService: networkService)
        defaultNetworkService = DefaultNetworkService(reAuthorizer: authService, errorParser: NetworkErrorParser())
    }
    
    func networkErrorParser() -> ErrorParsable {
        return NetworkErrorParser()
    }
    
    func networkService(with reAuthorizer: ReAuthorizable? = nil) -> NetworkService {
        return DefaultNetworkService(reAuthorizer: reAuthorizer, errorParser: networkErrorParser())
    }
    
    func authentificationService() -> ReAuthorizable {
        return AuthentificationService(networkService: networkService())
    }
    
    func ipDetectingService() -> IpDetectingService {
        return DefaultIpDetectingService(networkService: defaultNetworkService)
    }

}
