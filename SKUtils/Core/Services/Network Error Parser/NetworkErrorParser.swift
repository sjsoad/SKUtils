//
//  NetworkErrorParser.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib

class NetworkErrorParser: ErrorParsable {
    
    private var firstShouldFail: Bool = true
    
    func parseError(from JSON: Any, httpURLResponse: HTTPURLResponse?) -> NetworkError? {
        guard !firstShouldFail else {
            firstShouldFail = false
            let error = NSError(domain: httpURLResponse?.url?.host ?? "", code: 401,
                                userInfo: [NSLocalizedDescriptionKey: "Test refresh service"])
            return (error: error, code: 401)
        }
        guard let json = JSON as? [String: Any], let errorMessage = json["error"] else { return nil }
        let error = NSError(domain: httpURLResponse?.url?.host ?? "", code: httpURLResponse?.statusCode ?? 0,
                            userInfo: [NSLocalizedDescriptionKey: errorMessage])
        return (error: error, code: httpURLResponse?.statusCode)
    }
    
}
