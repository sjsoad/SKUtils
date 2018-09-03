//
//  IpDetectingRequest.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib

struct IpDetectingRequest: APIRequesting {
    
    // MARK: - APIRequesting -
    
    var requestType: RequestType { return .simple(nil) }
    var urlString: String { return "https://api.ipify.org?format=json" }
    
}
