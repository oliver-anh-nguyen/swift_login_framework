//
//  SigninPresenterTests.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 30/12/2022.
//

import XCTest
@testable import LoginFramework

class SigninPresenterTests: XCTestCase {
    
    var sut: SigninPresenter!
    var signinFormModel: SigninFormModel!
    var mockSigninModelValidator: MockSigninModelValidator!
    var mockSigninWebService: MockSigninWebService!
    var mockSigninViewDelegate: MockSigninViewDelegate!

    override func setUp() {
        signinFormModel = SigninFormModel(username: "oliver", password: "123")
        mockSigninModelValidator = MockSigninModelValidator()
        mockSigninWebService = MockSigninWebService()
        mockSigninViewDelegate = MockSigninViewDelegate()
        
        sut = SigninPresenter(formModelValidator: mockSigninModelValidator,
                              webservice: mockSigninWebService,
                              delegate: mockSigninViewDelegate)
    }
    
    override func tearDown() {
        sut = nil
        signinFormModel = nil
        mockSigninWebService = nil
        mockSigninViewDelegate = nil
        mockSigninModelValidator = nil
    }
    
    func testSigninPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Given
        
        // When
        sut.processUserSignin(formModel: signinFormModel)
        
        // Then
        XCTAssertTrue(mockSigninModelValidator.isUsernameValidated, "Username was empty")
        XCTAssertTrue(mockSigninModelValidator.isPasswordValidated, "Password was empty")
    }
    
    func testSigninPresenter_WhenGivenValidFormModel_ShouldCallSigninMethod() {
        // Given

        // When
        sut.processUserSignin(formModel: signinFormModel)
        
        // Then
        XCTAssertTrue(mockSigninWebService.isSigninMethodCalled, "The signin() method was not called in the SigninWebService class")
    }
    
    func testSigninPresenter_WhenSigninOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Given
        let myExpectation = expectation(description: "Expected the successfulSignin() method to be called")
        mockSigninViewDelegate.expectation = myExpectation
        
        // When
        sut.processUserSignin(formModel: signinFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Then
        XCTAssertEqual(mockSigninViewDelegate.successfulSigninCounter, 1, "The successfulSignin() method was called more than one time")
        XCTAssertEqual(mockSigninViewDelegate.errorHandlerCounter, 0)
        XCTAssertNotNil(mockSigninViewDelegate.responseModel)
    }
    
    func testSigninPresenter_WhenSigninOperationFails_ShouldCallErrorOnDelegate() {
        // Given
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSigninViewDelegate.expectation = errorHandlerExpectation
        mockSigninWebService.shouldReturnError = true
        
        // When
        sut.processUserSignin(formModel: signinFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Then
        XCTAssertEqual(mockSigninViewDelegate.successfulSigninCounter, 0)
        XCTAssertEqual(mockSigninViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSigninViewDelegate.signinError)
    }
    
    func testSigninPresenter_WhenUsernameWasEmpty_ShouldCallErrorUsernameEmptyOnDelegate() {
        // Given
        mockSigninModelValidator.isUsernameWasEmpty = true
        
        // When
        sut.processUserSignin(formModel: signinFormModel)

        // Then
        XCTAssertTrue(mockSigninViewDelegate.isUsernameEmpty)
    }
    
    func testSigninPresenter_WhenPasswordWasEmpty_ShouldCallErrorPasswordEmptyOnDelegate() {
        // Given
        mockSigninModelValidator.isPasswordWasEmpty = true
        
        // When
        sut.processUserSignin(formModel: signinFormModel)

        // Then
        XCTAssertTrue(mockSigninViewDelegate.isPasswordEmpty)
    }
    
    func testSigninPresenter_WhenEmailInvalid_ShouldCallErrorEmailInvalidOnDelegate() {
        // Given
        mockSigninModelValidator.isEmailFormatInValid = true
        
        // When
        sut.processUserSignin(formModel: signinFormModel)

        // Then
        XCTAssertTrue(mockSigninViewDelegate.isEmailInvalid)
    }
    
}
