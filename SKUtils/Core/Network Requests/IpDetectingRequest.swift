//
//  IpDetectingRequest.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKNetworkingLib

struct IpDetectingRequest: APIUploadRequesting {

    var accessToken: String?
    
    // MARK: - APIRequesting -

    var HTTPMethod: RequestMethod { return .get }
    var requestType: UploadRequestType { return .uploadData("Some".data!) }
    var urlString: String { return "https://api.ipify.org?format=json" }
    
}
