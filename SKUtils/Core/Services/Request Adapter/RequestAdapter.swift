//
//  RequestAdapter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 11/23/18.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Alamofire

class DefaultRequestAdapter: RequestAdapter {
    
    private var authentificationService: AuthentificationService
    
    init(with authentificationService: AuthentificationService) {
        self.authentificationService = authentificationService
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        authentificationService.accessToken.map({
            urlRequest.setValue("Bearer \($0)", forHTTPHeaderField: "Authorization")
        })
        return urlRequest
    }
    
}
