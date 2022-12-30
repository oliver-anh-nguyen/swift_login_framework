//
//  MockSigninPresenter.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation
@testable import LoginFramework

class MockSigninPresenter: SigninPresenterProtocol {
    
    var processUserSigninCall: Bool = false
    
    required init(formModelValidator: SigninModelValidatorProtocol,
                  webservice: SigninWebServiceProtocol,
                  delegate: SigninViewDelegate) {
        
    }
    
    func processUserSignin(formModel: SigninFormModel) {
        processUserSigninCall = true
    }
    
}
