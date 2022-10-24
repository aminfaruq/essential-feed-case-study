//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Amin faruq on 26/09/22.
//

public struct ResourceErrorViewModel {
    public let message: String?
    
    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
