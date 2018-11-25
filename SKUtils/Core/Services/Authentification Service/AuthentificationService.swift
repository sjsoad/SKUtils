//
//  AuthentificationService.swift
//  SKUtils
//
//  Created by Sergey on 24.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKNetworkingLib

protocol AuthentificationService: TokenRefreshingService {
    
    var accessToken: String? { get }
    func login()
}

class DefaultAuthentificationService {
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
}

// MARK: - AuthentificationService -

extension DefaultAuthentificationService: AuthentificationService {
    
    var accessToken: String? { return nil }
    
    func login() {
        // save auth credentials
    }
    
    func refreshToken(with completion: @escaping TokenRefreshingHandler) {
        completion(true)
    }
    
}
