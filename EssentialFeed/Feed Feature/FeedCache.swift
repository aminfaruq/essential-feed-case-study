//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Amin faruq on 29/09/22.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
