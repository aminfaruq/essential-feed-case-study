//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Amin faruq on 05/09/22.
//

import Foundation

public final class LocalFeedLoader {
    private let store: FeedStore
    private let currentDate: () -> Date
    
    public typealias SaveResult = Error?
    public typealias LoadResult = LoadFeedResult
    
    public init(store: FeedStore, currentDate: @escaping () -> Date) {
        self.store = store
        self.currentDate = currentDate
    }
    
    public func save(_ fedd: [FeedImage], completion: @escaping (SaveResult) -> Void) {
        store.deleteCachedFeed { [weak self] error in
            guard let self = self else { return }
            
            if let cacheDeletionError = error {
                completion(cacheDeletionError)
            } else {
                self.cache(fedd, with: completion)
            }
        }
    }
    
    public func load(completion: @escaping (LoadResult?) -> Void) {
        store.retrieve { [unowned self] result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .found(feed, timeStamp) where self.validate(timeStamp):
                completion(.success(feed.toModels()))
            case .found, .empty:
                completion(.success([]))
            }
        }
    }
    
    private func validate(_ timestamp: Date) -> Bool {
        let calendar = Calendar(identifier: .gregorian)
        guard let maxCacheAge = calendar.date(byAdding: .day, value: 7, to: timestamp) else { return false }
        return currentDate() < maxCacheAge
    }
    
    private func cache(_ feed: [FeedImage], with completion: @escaping (SaveResult) -> Void) {
        store.insert(feed.toLocal() , timestamp: currentDate()) { [weak self] errorData in
            guard self != nil else { return }
            
            completion(errorData)
        }
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        return map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}

private extension Array where Element == LocalFeedImage {
    func toModels() -> [FeedImage] {
        return map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url) }
    }
}