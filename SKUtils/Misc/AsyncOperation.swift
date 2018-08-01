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

    private var operationBlock: AsyncOperationBlock?
    private var finishedBlock: AsyncOperationBlock?
    
    open override var isAsynchronous: Bool {
        return !Thread.isMainThread
    }
    
    init(operationBlock: AsyncOperationBlock?, finishedBlock: AsyncOperationBlock?) {
        self.operationBlock = operationBlock
        self.finishedBlock = finishedBlock
    }
    
    override open func start() {
        guard isCancelled == false else { return }
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
            strongSelf.finishedBlock?(strongSelf)
        }
    }
    
}
