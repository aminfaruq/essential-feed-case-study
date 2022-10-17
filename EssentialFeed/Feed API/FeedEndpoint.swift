//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Amin faruq on 17/10/22.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
 }
