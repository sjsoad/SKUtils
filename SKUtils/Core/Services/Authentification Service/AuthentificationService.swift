//
//  AuthentificationService.swift
//  SKUtils
//
//  Created by Sergey on 24.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworking

class AuthentificationService: NSObject {

    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public -
    
    func refreshTokenAndRepeat<RequestType: APIRequesting>(request: RequestType, handlers: NetworkHandlers<RequestType>?) {
        request.update(accessToken: nil) // assign new token here
        networkService.execut(request: request, handlers: handlers)
    }
    
}
