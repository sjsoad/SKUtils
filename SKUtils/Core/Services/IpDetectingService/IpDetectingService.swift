//
//  IpDetectingService.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworking

class IpDetectingService: NSObject {

    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public -
    
    func detectIp(handlers: NetworkHandlers<IpDetectingRequest>) {
        let request = IpDetectingRequest()
        networkService.execut(request: request, handlers: handlers)
    }
    
}