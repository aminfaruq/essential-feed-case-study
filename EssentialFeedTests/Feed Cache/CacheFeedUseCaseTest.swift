//
//  CacheFeedUseCaseTest.swift
//  EssentialFeedTests
//
//  Created by Amin faruq on 05/09/22.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore){
        
    }
}

class FeedStore {
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTest: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation(){
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
