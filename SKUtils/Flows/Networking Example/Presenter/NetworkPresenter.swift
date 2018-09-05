//
//  NetworkPresenter.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import modules
import SKActivityViewable
import SKAlertViewable
import SKNetworkingLib

// #2 add support of protocols: ActivityViewable, AlertViewable
protocol NetworkInterface: class, ActivityViewable, AlertViewable {
    
    func set(ipAddress: String?)
    
}

protocol NetworkOutput: ViewLifecycleOutput {
    
}

class NetworkPresenter: NSObject {
    
    private weak var view: NetworkInterface?
    private var ipDetectingService: IpDetectingService
    
    init(with view: NetworkInterface, ipDetectingService: IpDetectingService) {
        self.view = view
        self.ipDetectingService = ipDetectingService
    }
    
}

// MARK: - NetworkOutput -

extension NetworkPresenter: NetworkOutput {
    
    func viewDidLoad() {
        // #6 create handlers
        // success: to process the success response from server
        // executingHandler: use default to show UI blocker, or custom if you need some specific actions
        // errorHandler: use default to show error message, or custom if you need some specific actions
        // requestHandler: if you need to store request object
        let handlers = NetworkHandlers<IpDetectingResponse>(successHandler: { [weak self] (response) in
            guard let ipAddress = response.result else { return }
            self?.view?.set(ipAddress: ipAddress)
        }, executingHandler: requestExecutingHandler(), errorHandler: requestErrorHandler(), requestHandler: { (request, error) in
            print(request ?? "no request")
            print(error?.localizedDescription ?? "no error")
        })
        // #7 use service to execute request
        ipDetectingService.detectIp(handlers: handlers)
    }
    
}

// MARK: - RequestExecuting -
// #3 add support of RequestExecuting to show UI blocker and for default executingHandler
extension NetworkPresenter: RequestExecuting {
    
    var activityView: ActivityViewable? {
        return view
    }
    
}

// MARK: - RequestErrorHandling -
// #4 add support of RequestErrorHandling to show error and for default requestErrorHandler
extension NetworkPresenter: RequestErrorHandling {

    var alertView: AlertViewable? {
        return view
    }

}
