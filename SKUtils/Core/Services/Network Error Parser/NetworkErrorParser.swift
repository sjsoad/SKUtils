//
//  NetworkErrorParser.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib

class NetworkErrorParser: ErrorParsing {
    
    func parseError(from JSON: Any, httpURLResponse: HTTPURLResponse?) -> NetworkError? {
        guard let json = JSON as? [String: Any], let errorMessage = json["error"] else { return nil }
        let error = NSError(domain: httpURLResponse?.url?.host ?? "", code: httpURLResponse?.statusCode ?? 0,
                            userInfo: [NSLocalizedDescriptionKey: errorMessage])
        return (error: error, code: httpURLResponse?.statusCode)
    }
    
}
