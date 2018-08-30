//
//  IpDetectingResponse.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//
import Foundation
import SKNetworkingLib

struct IpDetectingResponse: APIResponsing {

    var result: String?
    
    init(JSON: Any) {
        guard let json = JSON as? [String: Any] else {
            result = nil
            return
        }
        result = json["ip"] as? String
    }
}
