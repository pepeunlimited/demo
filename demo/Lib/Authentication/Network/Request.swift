//
// Created by Simo Ala-Kotila on 16.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import PromiseKit

// https://matteomanferdini.com/network-requests-rest-apis-ios-swift/

public enum Result<Response, Error> {
    case success(Response)
    case failure(Error)
}

struct Request<T : Decodable> {

    let session: URLSession
    let url: URL

    init(session: URLSession, url: URL) {
        self.session = session
        self.url = url
    }

    func start(_ callback: @escaping (Result<Response<T>, Error>) -> Void) {
        let req = URLRequest(url: url)
        let task = session.dataTask(with: req) { data, response, error in
            if let error = error {
                callback(.failure(error))
            } else if let data = data, let urlResponse = response as? HTTPURLResponse {
                callback(.success(Response(data: data, response: urlResponse)))
            }
        }
        task.resume()
    }
}

// PromiseKit wrapper
extension Request {
    func start(_: PMKNamespacer) -> Promise<Response<T>> {
        return Promise { seal in
                start { (result) in
                    switch result {
                    case .success(let resp):
                        // Handle response
                        seal.fulfill(resp)
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