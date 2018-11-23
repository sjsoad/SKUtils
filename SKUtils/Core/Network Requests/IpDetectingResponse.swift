//
//  IpDetectingResponse.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib
import ObjectMapper

class IpDetectingResponse: APIResponsing {
    
    typealias InputValueType = [String: Any]
    typealias ResultValueType = String
    
    private(set) var result: String?

    required init(with value: [String: Any]?) {
        result = value?["ip"] as? String
    }
    
}

class GenericResponse<Result>: APIResponsing {

    typealias InputValueType = [String: Any]
    typealias ResultValueType = Result
    
    private(set) var result: Result?
    
    required init(with value: InputValueType?) {
        result = value?["ip"] as? Result
    }
    
}

class GenericMappableResponse<Result: Mappable>: APIResponsing {
    
    typealias InputValueType = [String: Any]
    typealias ResultValueType = Result
    
    private(set) var result: Result?
    
    required init(with value: InputValueType?) {
        value.map({ result = Result(JSON: $0) })
    }
    
}

class GenericMappableSequenceResponse<Result: Mappable>: APIResponsing {
    
    typealias InputValueType = [[String: Any]]
    typealias ResultValueType = [Result]
    
    private(set) var result: [Result]?
    
    required init(with value: InputValueType?) {
        value.map({ result = $0.compactMap({ Result(JSON: $0) }) })
    }
    
}
