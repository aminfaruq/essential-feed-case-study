//
//  ImageCommentsLocalizationTest.swift
//  EssentialFeedTests
//
//  Created by Amin faruq on 10/10/22.
//

import XCTest
import EssentialFeed

class ImageCommentsLocalizationTest: XCTestCase {
    
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
}
