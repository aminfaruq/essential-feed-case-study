//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Amin faruq on 06/09/22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
    
    var item: FeedImage {
        return FeedImage(id: id, description: description, location: location, url: image) }
}
