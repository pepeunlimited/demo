//
// Created by Simo Ala-Kotila on 15.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation

protocol Authentication {

    var url: URL { get }

    func login(usernameOrEmail username: String, password: String) -> Request<HTTPBinGet>

    func createUser(email: String, username: String?, password: String)
}