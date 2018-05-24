//
//  AdvancedRequestErrorHandling.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKNetworking
import Foundation

protocol AdvancedRequestErrorHandling: RequestErrorHandling {
    
     var authentificationService: AuthentificationService? { get }
    
}

extension AdvancedRequestErrorHandling where Self: NSObject {
    
    func requestErrorHandler<RequestType: APIRequesting>() -> ErrorHandler<RequestType> {
        return { [weak self] (networkError, failedRequest, handlers)  in
            if networkError.statusCode == NetworkErrorCode.unauthorized.rawValue {
                self?.authentificationService?.refreshTokenAndRepeat(request: failedRequest, handlers: handlers)
            } else {
                guard let view = self?.alertView else { return }
                view.show(message: networkError.error.localizedDescription, state: .error)
            }
        }
    }

}
