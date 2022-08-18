//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Amin faruq on 27/07/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
