//
//  FeedViewControllerTest+FeedImageDataLoaderSpy.swift
//  EssentialFeediOSTests
//
//  Created by Amin faruq on 19/09/22.
//

import Foundation
import EssentialFeed
import EssentialFeediOS

extension FeedUIIntegrationTest {
    class LoaderSpy : FeedLoader, FeedImageDataLoader {
        
        private var feedRequest = [(FeedLoader.Result) -> Void]()
        
        var loadFeedCallCount: Int {
            return feedRequest.count
        }
        
        func load(completion: @escaping (FeedLoader.Result) -> Void) {
            feedRequest.append(completion)
        }
        
        func completeFeedLoading(with feed: [FeedImage] = [], at index: Int = 0) {
            feedRequest[index](.success(feed))
        }
        
        func completeFeedLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "an error", code: 0)
            feedRequest[index](.failure(error))
        }
        
        // MARK: - FeedImageDataLoader
        
        private struct TaskSpy: FeedImageDataLoaderTask {
            let cancelCallback: () -> Void
            func cancel() {
                cancelCallback()
            }
        }
        
        private var imageRequests = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
        
        var loadedImageURLs: [URL] {
            return imageRequests.map { $0.url }
        }
        
        private(set) var cancelledImageURLs = [URL]()
        
        func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
            imageRequests.append((url, completion))
            return TaskSpy { [weak self] in self?.cancelledImageURLs.append(url) }
        }
        
        func completeImageLoading(with imageData: Data = Data(), at index: Int = 0) {
            imageRequests[index].completion(.success(imageData))
        }
        
        func completeImageLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "an error", code: 0)
            imageRequests[index].completion(.failure(error))
        }
        
    }
}
