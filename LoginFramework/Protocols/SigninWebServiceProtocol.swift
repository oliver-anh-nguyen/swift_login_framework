//
//  SigninWebServiceProtocol.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

protocol SigninWebServiceProtocol {
    func signin(withForm formModel: SigninRequestModel, completionHandler: @escaping (SigninResponseModel?, SigninError?) -> Void)
}
