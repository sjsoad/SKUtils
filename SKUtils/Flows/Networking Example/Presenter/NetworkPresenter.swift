//
//  NetworkPresenter.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
import SKActivityViewable
import SKAlertViewable
import SKNetworking

protocol NetworkInterface: class, ActivityViewable, AlertViewable {
    
    func set(ipAddress: String?)
    
}

protocol NetworkOutput {
    
    func viewDidLoad()
    
}

class NetworkPresenter: NSObject {
    
    private weak var view: NetworkInterface?
    
    private var servicesRepository: ServicesRepository
    private var ipDetectingService: IpDetectingService?
    private(set) var authentificationService: AuthentificationService?
    
    init(with view: NetworkInterface, servicesRepository: ServicesRepository) {
        self.view = view
        self.servicesRepository = servicesRepository
        self.ipDetectingService = servicesRepository.getService()
        self.authentificationService = servicesRepository.getService()
    }
    
}

// MARK: - NetworkOutput -

extension NetworkPresenter: NetworkOutput {
    
    func viewDidLoad() {
        let handlers = NetworkHandlers<IpDetectingRequest>(successHandler: { [weak self] (response) in
            guard let ipAddress = response.result else { return }
            self?.view?.set(ipAddress: ipAddress)
        }, executingHandler: requestExecutingHandler(), errorHandler: requestErrorHandler(), requestHandler: { (request, error) in
            print(request ?? "no request")
            print(error?.localizedDescription ?? "no error")
        })
        ipDetectingService?.detectIp(handlers: handlers)
    }
    
}

// MARK: - RequestExecuting -

extension NetworkPresenter: RequestExecuting {
    
    var activityView: ActivityViewable? {
        return view
    }
    
}

//// MARK: - RequestErrorHandling -
//
//extension NetworkPresenter: RequestErrorHandling {
//
//    var alertView: AlertViewable? {
//        return view
//    }
//
//}

// MARK: - AdvancedRequestErrorHandling -

extension NetworkPresenter: AdvancedRequestErrorHandling {
    
    var alertView: AlertViewable? {
        return view
    }
    
}
