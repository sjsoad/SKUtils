//
//  IpDetectingService.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKNetworkingLib

protocol IpDetectingService {
 
    func detectIp(with completion: @escaping (String) -> Void, _ executingHandler: RequestExecutingHandler?, _ errorHandler: ErrorHandler?)
    
}

class DefaultIpDetectingService: IpDetectingService {

    private var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: - Public -
    
    func detectIp(with completion: @escaping (String) -> Void, _ executingHandler: RequestExecutingHandler?, _ errorHandler: ErrorHandler?) {
        // #6 create handlers
        // success: to process the success response from server
        // executingHandler: use default to show UI blocker, or custom if you need some specific actions
        // errorHandler: use default to show error message, or custom if you need some specific actions
        // requestHandler: if you need to store request object
        let handlers = NetworkHandlers<IpDetectingResponse>(successHandler: completion, executingHandler: executingHandler,
                                                            errorHandler: errorHandler)
        //        let handlers = NetworkHandlers<GenericResponse<String>>(successHandler: { [weak self] (ipAddress) in
        //            self?.view?.set(ipAddress: ipAddress)
        //        }, executingHandler: handleExecuting, errorHandler: handleError, requestHandler: { (result) in
        //            result.value.map({ print($0) })
        //        })
        //        let handlers = NetworkHandlers<GenericMappableResponse<IpAddress>>(successHandler: { [weak self] (ipAddress) in
        //            self?.view?.set(ipAddress: ipAddress.ipAddress)
        //        }, executingHandler: handleExecuting, errorHandler: handleError)
        let request = IpDetectingRequest()
        networkService.execute(request, with: handlers)
//        networkService.execute(request, with: handlers, { result in
//            
//        })
    }
    
}
