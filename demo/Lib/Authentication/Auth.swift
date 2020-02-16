//
// Created by Simo Ala-Kotila on 15.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation


struct Auth {
    public static func authentication(host: String, session: URLSession = .shared) -> Authentication {
        guard let url = URL(string: host) else { fatalError("host is not valid \(host)") }
        return DemoAuthentication(url: url)
    }
}

