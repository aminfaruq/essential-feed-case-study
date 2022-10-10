//
//  FeedViewControllerTest+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Amin faruq on 21/09/22.
//

import Foundation
import XCTest
import EssentialFeed

extension FeedUIIntegrationTest {
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
    
    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }
    
    var feedTitle: String {
        FeedPresenter.title
    }
}
