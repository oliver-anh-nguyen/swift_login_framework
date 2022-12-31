//
//  MockWebService.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//

import Foundation

class MockWebService: SigninWebServiceProtocol {
    
    func signin(withForm formModel: SigninRequestModel, completionHandler: @escaping (SigninResponseModel?, SigninError?) -> Void) {
        let responseModel = SigninResponseModel(token: "ok")
        completionHandler(responseModel, nil)
    }
    
}
