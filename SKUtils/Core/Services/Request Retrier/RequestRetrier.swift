//
//  RequestRetrier.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 11/23/18.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Alamofire

class DefaultRequestRetrier: RequestRetrier {
    
    private var authentificationService: AuthentificationService
    private var failedRequests: [Request]
    private var isRefreshing: Bool
    
    init(with authentificationService: AuthentificationService) {
        self.authentificationService = authentificationService
        self.failedRequests = []
        self.isRefreshing = false
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        request.response.map({
            guard $0.statusCode == 401 else { return }
            failedRequests.append(request)
            if !isRefreshing {
                isRefreshing.toggle()
                authentificationService.refreshToken(with: { [weak self] in
                    self?.isRefreshing.toggle()
                    self?.failedRequests.forEach({ _ in completion(true, 0) })
                    self?.failedRequests.removeAll()
                })
            }
        }) ?? completion(false, 0)
    }
    
}
