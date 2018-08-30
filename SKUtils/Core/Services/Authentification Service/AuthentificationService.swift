//
//  AuthentificationService.swift
//  SKUtils
//
//  Created by Sergey on 24.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKNetworkingLib

class AuthentificationService: ReAuthorizable {
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - ReAuthorizable -
    
    func reAuthAndRepeat<RequestType>(_ request: RequestType, completion: (RequestType?) -> Void) {
        
    }
    
}
