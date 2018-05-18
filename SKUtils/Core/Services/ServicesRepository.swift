//
//  ServicesRepository.swift
//  Yada
//
//  Created by Sergey on 16.02.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import Foundation

class ServicesRepository {

    private var registry = [String: Any]()
    
    init() {}
    
    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func getService<T>() -> T? {
        let key = "\(T.self)"
        if registry[key] == nil {
            print("### ServicesRepository: Nil value for \(key) ###")
        }
        return registry[key] as? T
    }
    
}
