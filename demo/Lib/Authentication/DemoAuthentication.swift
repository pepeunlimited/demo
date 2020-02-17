//
// Created by Simo Ala-Kotila on 15.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation

struct DemoAuthentication : Authentication {

    let url: URL
    let session: URLSession = .shared

    init(url: URL) {
        self.url = url
    }

    func login(usernameOrEmail username: String, password: String) -> Request<HTTPBinGet> {
        return Request<HTTPBinGet>(session: session, url: url)
    }

    func createUser(email: String, username: String?, password: String) {

    }
}
