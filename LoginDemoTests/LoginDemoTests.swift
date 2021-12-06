// Created by Anatoly Qstove on 29.10.2021.

import XCTest
@testable import LoginDemo

class LoginDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testLoginWithEmptyUserName() {
        let exep = expectation(description: "Login with empty Username")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller1(expection: exep))
        loginPresenter.login(userId: "", password: "12345")
        wait(for: [exep], timeout: 3)
    }
    
    func testLoginWithMinLenghtUserName() {
        let expec = expectation(description: "Login with min length of Username")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller2(expection: expec))
        loginPresenter.login(userId: "Hi", password: "1234567")
        wait(for: [expec], timeout: 3)
    }
    
    func testLoginWithEmptyPassword() {
        let expet = expectation(description: "Login with empty password")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller3(expection : expet))
        loginPresenter.login(userId: "123456", password: "")
        wait(for: [expet], timeout: 3)
    }
    
    func testLoginWithMinLengthPassword() {
        let expet = expectation(description: "Login with min length of password")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller4(expection : expet))
        loginPresenter.login(userId: "hello", password: "123")
        wait(for: [expet], timeout: 3)
    }
    
    func testLoginwithWrongDetails(){
        let expet = expectation(description: "Login with wrong credentials")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller5(expection: expet))
        loginPresenter.login(userId: "hello", password: "hello")
        wait(for: [expet], timeout: 3)
    }
    
    func testLoginwithCorrectDetails(){
        let expet = expectation(description: "Login with wrong credentials")
        let loginPresenter = LoginPresenter(delegate: MocUIcontroller6(expection: expet))
        loginPresenter.login(userId: "test123", password: "test123")
        wait(for: [expet], timeout: 3)
    }
    
}

class MocUIcontroller1 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {
        XCTAssertEqual(message, emptyUserName)
        self.expec.fulfill()
    }
    func validationSuccess() {}
    func validationFail(message: String) {}
}

class MocUIcontroller2 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {
        XCTAssertEqual(message,minMaxUserName )
        self.expec.fulfill()
    }
    func validationSuccess() {}
    func validationFail(message: String) {}
}

class MocUIcontroller3 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {
        XCTAssertEqual(message,emptyPassword )
        self.expec.fulfill()
    }
    func validationSuccess() {}
    func validationFail(message: String) {}
}

class MocUIcontroller4 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {
        XCTAssertEqual(message,minMaxPassword )
        self.expec.fulfill()
    }
    func validationSuccess() {}
    func validationFail(message: String) {}
}

class MocUIcontroller5 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {}
    func validationSuccess() {}
    func validationFail(message: String) {
        XCTAssertEqual(message,wrongCred )
        self.expec.fulfill()
    }
}

class MocUIcontroller6 : loginDelegate {
    var expec : XCTestExpectation
    init(expection : XCTestExpectation) {
        self.expec = expection
    }
    func showAlert(message: String) {}
    func validationSuccess() {
        XCTAssertTrue(true)
        self.expec.fulfill()
    }
    func validationFail(message: String) {}
}
