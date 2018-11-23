//
//  IpAddress.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 11/23/18.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import ObjectMapper

struct IpAddress: Mappable {

    var ipAddress: String

    init?(map: Map) {
        ipAddress = String()
    }
    
    mutating func mapping(map: Map) {
        ipAddress <- map["ip"]
    }
    
}
