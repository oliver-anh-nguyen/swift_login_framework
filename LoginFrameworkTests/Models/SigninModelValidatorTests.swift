//
//  SigninModelValidatorTests.swift
//  LoginFrameworkTests
//
//  Created by AnhNguyen on 29/12/2022.
//

import XCTest
@testable import LoginFramework

class SigninModelValidatorTests: XCTestCase {
    
    var sut: SigninModelValidator!

    override func setUp() {
        sut = SigninModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: Username Validation Unit Tests
    func testSigninModelValidator_WhenValidUserNameProvided_ShouldReturnTrue() {
        // Given
        
        // When
        let isUserNameValid = sut.isUserNameValid(username: "oliver")
        
        // Then
        XCTAssertTrue(isUserNameValid, "The isUserNameValid() should have returned TRUE for a valid username but returned FALSE")
    }
    
    func testSigninModelValidator_WhenUserNameIsEmpty_ShouldReturnFalse() {
        // Given
        
        // When
        let isUserNameValid = sut.isUserNameValid(username: "")
        
        // Then
        XCTAssertFalse(isUserNameValid, "The isUserNameValid() should have returned FALSE for a  username is empty but it has returned TRUE")
    }
    
    // MARK: Password Validation Unit Tests
    func testSigninModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Given
        
        // When
        let isPasswordValid = sut.isUserNameValid(username: "oliver")
        
        // Then
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSigninModelValidator_WhenPasswordIsEmpty_ShouldReturnFalse() {
        // Given
        
        // When
        let isPasswordValid = sut.isPasswordValid(password: "")
        
        // Then
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a  password is empty but it has returned TRUE")
    }
}
