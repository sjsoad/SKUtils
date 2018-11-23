//
//  AuthentificationService.swift
//  SKUtils
//
//  Created by Sergey on 24.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKNetworkingLib

class AuthentificationService: ReAuthorizable {
    
    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - ReAuthorizable -
    
    func reAuthAndRepeat<RequestType>(_ request: RequestType, completion: @escaping (RequestType) -> Void) where RequestType: APIRequesting {
        // request.accessToken = new access token
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            completion(request)
        }
    }
    
}
