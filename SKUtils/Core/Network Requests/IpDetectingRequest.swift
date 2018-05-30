//
//  IpDetectingRequest.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib

typealias IpDetectingResponseType = String

class IpDetectingRequest: AuthentificatedAPIRequesting {
    
    typealias ResponseType = IpDetectingResponse
    
    var accessToken: String?
    
    init() {
    }
    
    // MARK: - APIRequesting -
    
    var urlString: String {
        return "https://api.ipify.org?format=json"
    }
    
}
