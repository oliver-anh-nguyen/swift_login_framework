//
//  SigninViewDelegate.swift
//  LoginFramework
//
//  Created by AnhNguyen on 29/12/2022.
//

import Foundation

protocol SigninViewDelegate: AnyObject {
    func successfulSignin(data: SigninResponseModel)
    func errorSignin(error: SigninError)
    func errorUsernameIsEmpty()
    func errorPasswordIsEmpty()
    func errorFormatEmail()
}
