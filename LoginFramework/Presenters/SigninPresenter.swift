//
//  SigninPresenter.swift
//  LoginFramework
//
//  Created by AnhNguyen on 30/12/2022.
//

import Foundation

final class SigninPresenter: SigninPresenterProtocol {
    
    private var modelValidator: SigninModelValidatorProtocol
    private var webService: SigninWebServiceProtocol
    private weak var delegate: SigninViewDelegate?
    
    required init(formModelValidator: SigninModelValidatorProtocol,
                  webservice: SigninWebServiceProtocol,
                  delegate: SigninViewDelegate) {
        self.modelValidator = formModelValidator
        self.webService = webservice
        self.delegate = delegate
    }
    
    func processUserSignin(formModel: SigninFormModel) {
        
        if !modelValidator.isUserNameValid(username: formModel.username) {
            self.delegate?.errorUsernameIsEmpty()
            return
        }
        
        if !modelValidator.isValidEmailFormat(email: formModel.username) {
            self.delegate?.errorFormatEmail()
            return
        }
        
        if !modelValidator.isPasswordValid(password: formModel.password) {
            self.delegate?.errorPasswordIsEmpty()
            return
        }
        
        let requestModel = SigninRequestModel(username: formModel.username, password: formModel.password)
        
        webService.signin(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorSignin(error: error)
                return
            }
            
            if let model = responseModel {
                self?.delegate?.successfulSignin(data: model)
            }
        }
    }
}
