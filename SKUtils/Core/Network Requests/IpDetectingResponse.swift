//
//  IpDetectingResponse.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//
import Foundation
import SKNetworkingLib

class IpDetectingResponse: APIResponsing {
    
    var result: IpDetectingResponseType?
    
    required init(JSON: AnyObject) {
        guard let json = JSON as? [String: Any] else {
            result = nil
            return
        }
        result = json["ip"] as? String
    }
}
