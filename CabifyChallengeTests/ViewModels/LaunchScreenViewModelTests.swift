//
//  LaunchScreenViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Bryan Caro on 25/2/23.
//

import XCTest
@testable import CabifyChallenge

final class LaunchScreenViewModelTests: XCTestCase {
    var sut: LaunchScreenViewModel!
    var delegate: LaunchScreenUseCasesOutputProtocol!
    override func setUp() {
        sut = LaunchScreenViewModel(repository: LaunchScreenRepository(output: delegate))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_isLoading_shouldBeTrue() {
        //  GIVEN
        let isLoading = sut.isLoading
        
        //  WHEN
        
        //  THEN
        XCTAssertTrue(isLoading)
    }

    
    func test_isLoading_afterTwoSeg_shouldBeFalse() {
        //  GIVEN
        let expectation = XCTestExpectation(description: "Async operation")
        let repository = sut.repository
        var isLoading = true
        
        //  WHEN
        repository?.onAppear()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = self.sut.isLoading
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.5)
        
        //  THEN
        XCTAssertFalse(isLoading)
    }
}
