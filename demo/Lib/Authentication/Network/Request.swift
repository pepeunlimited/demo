//
// Created by Simo Ala-Kotila on 16.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import PromiseKit

// https://matteomanferdini.com/network-requests-rest-apis-ios-swift/
public enum Result<Success, Error> {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Error)
}

struct Request {

    let session: URLSession
    let url: URL

    init(session: URLSession, url: URL) {
        self.session = session
        self.url = url
    }

    func start(_ callback: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let req = URLRequest(url: url)
        let task = session.dataTask(with: req) { data, response, error in
            if let error = error {
                callback(.failure(error))
            } else if let data = data, let urlResponse = response as? HTTPURLResponse {
                callback(.success((data, urlResponse)))
            }
        }
        task.resume()
    }
}

// PromiseKit wrapper
extension Request {
    func start(_: PMKNamespacer) -> Promise<Data> {
        return Promise { seal in
                start { (result) in
                    switch result {
                    case .success(let data, let urlResponse):
                        // Handle response
                        seal.fulfill(data)
                        break
                    case .failure(let error):
                        // Handle error
                        print(error)
                        seal.reject(error)
                        break
                    }
                }
        }
    }
}