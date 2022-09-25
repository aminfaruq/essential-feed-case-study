//
//  FeedPresenterTest.swift
//  EssentialFeedTests
//
//  Created by Amin faruq on 25/09/22.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTest: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let (_,view) = makeSUT()
                
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messase")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
            let view = ViewSpy()
            let sut = FeedPresenter(view: view)
            trackForMemoryLeaks(view, file: file, line: line)
            trackForMemoryLeaks(sut, file: file, line: line)
            return (sut, view)
        }
    
    private class ViewSpy {
        let messages = [Any]()
    }
}

