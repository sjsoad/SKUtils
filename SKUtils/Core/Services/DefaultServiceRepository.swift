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
    
}

struct DefaultServiceRepository: ServicesRepository {

    static let shared: ServicesRepository = DefaultServiceRepository()
    
    let defaultNetworkService: NetworkService = {
       return DefaultServiceRepository.shared.networkService(with: DefaultServiceRepository.shared.authentificationService())
    }()
    
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
