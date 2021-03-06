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
    
    var result: String?
    
    required init(with value: Any) {
        guard let json = value as? [String: Any] else {
            result = nil
            return
        }
        result = json["ip"] as? String
    }
}
