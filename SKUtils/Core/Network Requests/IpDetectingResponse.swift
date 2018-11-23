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
    
    typealias InputValueType = [String: Any]
    typealias ResultValueType = String
    
    var result: String?

    required init(with value: [String: Any]?) {
        result = value?["ip"] as? String
    }
    
}
