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
    
}

extension AdvancedRequestErrorHandling where Self: NSObject {
    
    func requestErrorHandler<RequestType: APIRequesting>() -> ErrorHandler<RequestType> {
        return { [weak self] (networkError, failedRequest)  in
            if networkError.statusCode == NetworkErrorCode.unauthorized.rawValue {
                print(failedRequest)
            } else {
                guard let view = self?.alertView else { return }
                view.show(message: networkError.error.localizedDescription, state: .error)
            }
        }
    }

}
