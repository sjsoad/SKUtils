//
//  ViewAnimationsPresenter.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ViewAnimationsInterface: class {
    
}

protocol ViewAnimationsOutput {
    
    func viewTriggeredActionEvent()
    
}

class ViewAnimationsPresenter: NSObject {
    
    private weak var view: ViewAnimationsInterface?

    private var operation: AsyncBlockOperation?
    private var queue: OperationQueue = OperationQueue()
    
    init(with view: ViewAnimationsInterface) {
        self.view = view
    }
    
}

// MARK: - ViewAnimationsOutput -

extension ViewAnimationsPresenter: ViewAnimationsOutput {

    func viewTriggeredActionEvent() {
        operation?.cancel()
        operation = AsyncBlockOperation(operationBlock: { (operation) in
            print("do something")
            sleep(10)
            operation.finish()
        })
        operation?.completionBlock = { [weak self] in
            print("operation")
            print(self?.operation?.isFinished ?? "nothing")
        }
//        guard let operation = operation else { return }
//        queue.addOperation(operation)
        operation?.start()
    }
    
}
