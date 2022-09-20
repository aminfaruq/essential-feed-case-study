//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Amin faruq on 19/09/22.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
