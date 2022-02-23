//
//  SwiftUIMVVMCombineArtclesTests.swift
//  SwiftUIMVVMCombineArtclesTests
//
//  Created by Rajendran Eshwaran on 2/21/22.
//

import XCTest
import Combine
@testable import SwiftUIMVVMCombineArtcles

class SwiftUIMVVMCombineArtclesTests: XCTestCase {
    var model : ArticleViewModel!
    var service : ArticleServiceManager!
    var cancellable = Set<AnyCancellable>()
    override func setUpWithError() throws {
       model = ArticleViewModel()
       service = ArticleServiceManager()
    }

    override func tearDownWithError() throws {
        model = nil
        service = nil
    }

    func testExample() throws {
        
    }

    func testAtricleViewModel() throws{
        let expectation = XCTestExpectation(description: "Performing Publisher Test")
        var articles : [Article] = []
        model.getCallServiceManager()
        model.$articleData.sink(receiveCompletion: {completion in
            expectation.fulfill()
        }, receiveValue: {result in
            articles.append(contentsOf: result)
            if articles.count == 20
            {
                expectation.fulfill()
            }
        }).store(in: &cancellable)
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(articles.count, 20)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
