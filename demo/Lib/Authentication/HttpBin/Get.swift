//
// Created by Simo Ala-Kotila on 17.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation

struct HttpBingGet: Decodable {

    public let origin: String

    init(origin: String) {
        self.origin = origin
    }
}