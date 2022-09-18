//
//  FeedViewControllerTest.swift
//  EssentialFeediOSTests
//
//  Created by Amin faruq on 18/09/22.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTest.LoaderSpy) {
        
    }
}

class FeedViewControllerTest: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    

    // MARK: - Helpers

    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }

}
