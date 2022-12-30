//
//  MockSigninWebService.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation
@testable import LoginFramework

class MockSigninWebService: SigninWebServiceProtocol {
    
    var isSigninMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signin(withForm formModel: SigninRequestModel, completionHandler: @escaping (SigninResponseModel?, SigninError?) -> Void) {
        
        isSigninMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SigninError.failedRequest(description: "Signin request was not successfully"))
        } else {
            let responseModel = SigninResponseModel(token: "ok")
            completionHandler(responseModel, nil)
        }
    }
    
}
