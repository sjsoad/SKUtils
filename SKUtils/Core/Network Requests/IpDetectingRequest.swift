//
//  IpDetectingRequest.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworking

typealias IpDetectingResponseType = String

class IpDetectingRequest: APIRequesting {
    
    var accessToken: String?
    
    typealias ResponseType = IpDetectingResponse
    
    init() {
    }
    
    // MARK: - APIRequesting -
    
    var urlString: String {
        return "https://api.ipify.org?format=json"
    }
    
}
