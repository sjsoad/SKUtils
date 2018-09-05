//
//  Example.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol TitleProvidable {
    
    var title: String { get set }
    
}

protocol BuilderProvidable {
    
    var builder: ModuleBuilder { get }
    
}

struct Example: TitleProvidable, BuilderProvidable {

    var title: String
    var builder: ModuleBuilder
    
}
