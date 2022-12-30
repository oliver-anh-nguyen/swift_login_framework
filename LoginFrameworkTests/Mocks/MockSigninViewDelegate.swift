//
//  MockSigninViewDelegate.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation
@testable import LoginFramework
import XCTest

class MockSigninViewDelegate: SigninViewDelegate {
    
    var expectation: XCTestExpectation?
    
    var successfulSigninCounter = 0
    var responseModel: SigninResponseModel?
    
    var errorHandlerCounter = 0
    var signinError: SigninError?
    
    var isUsernameEmpty = false
    var isPasswordEmpty = false
    
    
    func successfulSignin(data: SigninResponseModel) {
        responseModel = data
        successfulSigninCounter += 1
        expectation?.fulfill()
    }
    
    func errorSignin(error: SigninError) {
        signinError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    func errorUsernameIsEmpty() {
        isUsernameEmpty = true
    }
    
    func errorPasswordIsEmpty() {
        isPasswordEmpty = true
    }
    
}
