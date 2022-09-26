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
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let value = bundle.localizedString(forKey: key, value: nil, table: table)
        if value == key {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return value
    }
}
