//
//  AsyncOperation.swift
//  SKUtils
//
//  Created by Sergey on 01.08.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias AsyncOperationBlock = ((AsyncBlockOperation) -> Void)

open class AsyncBlockOperation: Operation {
    
    enum State: String {
        case isReady, isExecuting, isFinished
    }
    
    private var operationBlock: AsyncOperationBlock?
    
    var state = State.isReady {
        willSet {
            willChangeValue(forKey: state.rawValue)
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
    
    open override var isExecuting: Bool {
        return state == .isExecuting
    }
    
    open override var isFinished: Bool {
        return state == .isFinished
    }
    
    init(operationBlock: AsyncOperationBlock?) {
        self.operationBlock = operationBlock
    }
    
    override open func start() {
        guard isCancelled == false else { return }
        state = .isExecuting
        main()
    }
    
    override open func main() {
        guard isCancelled == false else { return }
        DispatchQueue.global().async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.operationBlock?(strongSelf)
        }
    }
    
    func finish() {
        guard isCancelled == false else { return }
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.state = .isFinished
        }
    }
    
}
