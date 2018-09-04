//
//  IpDetectingService.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworkingLib

protocol IpDetectingService {
 
    func detectIp(handlers: NetworkHandlers<IpDetectingResponse>)
    
}

class DefaultIpDetectingService: IpDetectingService {

    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public -
    
    func detectIp(handlers: NetworkHandlers<IpDetectingResponse>) {
        let request = IpDetectingRequest()
        networkService.execute(request, with: handlers)
    }
    
}
