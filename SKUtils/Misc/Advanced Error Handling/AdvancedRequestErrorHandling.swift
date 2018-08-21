//
//  AdvancedRequestErrorHandling.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKNetworkingLib
import Foundation

// AdvancedRequestErrorHandling
// Allows you to handle 401 status code, refresh token and repeat failed request

protocol AdvancedRequestErrorHandling: RequestErrorHandling {
    
     var authentificationService: AuthentificationService? { get }
    
}

extension AdvancedRequestErrorHandling where Self: NSObject {
    
    func requestErrorHandler<RequestType: AuthentificatedAPIRequesting>() -> ErrorHandler<RequestType> {
        return { [weak self] (networkError, failedRequest, handlers)  in
            guard networkError.statusCode == NetworkErrorCode.unauthorized.rawValue else {
                self?.alertView?.show(message: networkError.error.localizedDescription, state: .error)
                return
            }
            self?.authentificationService?.refreshTokenAndRepeat(request: failedRequest, handlers: handlers)
        }
    }

}
