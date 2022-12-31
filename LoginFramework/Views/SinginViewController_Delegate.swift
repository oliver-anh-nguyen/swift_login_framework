//
//  SinginViewController_Validator.swift
//  LoginFramework
//
//  Created by AnhNguyen on 31/12/2022.
//


extension SigninViewController: SigninViewDelegate {
    
    func successfulSignin(data: SigninResponseModel) {
        self.displayAlertWithMessage(message: data.token,
                                               viewController: self)
    }
    
    func errorSignin(error: SigninError) {
        var mess = "Something wrong! Please try again!"
        if let errorDes = error.errorDescription, errorDes != "" {
            mess = errorDes
        }
        self.displayAlertWithMessage(message: mess,
                                               viewController: self)
    }
    
    func errorUsernameIsEmpty() {
        self.displayAlertWithMessage(message: "Username cannot be empty!", viewController: self)
    }
    
    func errorPasswordIsEmpty() {
        self.displayAlertWithMessage(message: "Password cannot be empty!", viewController: self)
    }
    
    func errorFormatEmail() {
        self.displayAlertWithMessage(message: "This email looks incorrect, please retry!", viewController: self)
    }

}
