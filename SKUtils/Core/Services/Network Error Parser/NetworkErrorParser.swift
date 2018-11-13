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
    
    func parseError(from JSON: Any, httpURLResponse: HTTPURLResponse?) -> Error? {
        guard let json = JSON as? [String: Any], let errorMessage = json["error"] else { return nil }
        return NSError(domain: httpURLResponse?.url?.host ?? "", code: httpURLResponse?.statusCode ?? 0,
                       userInfo: [NSLocalizedDescriptionKey: errorMessage])
    }
    
}
