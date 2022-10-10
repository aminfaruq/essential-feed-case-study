//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Amin faruq on 26/09/22.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
