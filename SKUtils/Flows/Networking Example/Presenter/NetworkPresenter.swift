//
//  NetworkPresenter.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
// #1 import modules
import SKActivityViewable
import SKAlertViewable
import SKNetworkingLib
import Alamofire

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
        // #7 use service to execute request
        view.map({ ipDetectingService.detectIp(with: $0.set, handleExecuting, handleError) })
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
