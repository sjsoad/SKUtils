//
//  AsyncOperation.swift
//  SKUtils
//
//  Created by Sergey on 01.08.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

public typealias AsyncOperationBlock = ((AsyncOperation) -> Void)

open class AsyncOperation: Operation {

    private var operationBlock: AsyncOperationBlock?
    private var finishedBlock: AsyncOperationBlock?
    
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
        operationBlock?(self)
    }
    
    func finish() {
        finishedBlock?(self)
    }
    
}
