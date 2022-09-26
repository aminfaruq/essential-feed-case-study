//
//  HTTPClientSpy.swift
//  EssentialFeedTests
//
//  Created by Amin faruq on 26/09/22.
//

import Foundation
import EssentialFeed

class HTTPClientSpy: HTTPClient {
    private struct Task: HTTPClientTask {
        func cancel() {}
    }
    
    private var messages = [(url: URL, completion: (HTTPClient.Result) -> Void)]()
    
    var requestedURLs: [URL] {
        return messages.map { $0.url }
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask{
        messages.append((url, completion))
        return Task()
    }
    
    func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    func complete(withStatusCode code: Int, data: Data, at index: Int = 0) {
        let response = HTTPURLResponse(
            url: requestedURLs[index],
            statusCode: code,
            httpVersion: nil,
            headerFields: nil)!
        messages[index].completion(.success((data, response)))
    }
}
