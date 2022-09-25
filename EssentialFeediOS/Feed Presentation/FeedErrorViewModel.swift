//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Amin faruq on 25/09/22.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
