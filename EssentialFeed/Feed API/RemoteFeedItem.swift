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
    
    var item: FeedItem {
        return FeedItem(id: id, description: description, location: location, imageURL: image) }
}
