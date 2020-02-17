//
// Created by Simo Ala-Kotila on 17.2.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation

struct Response<T : Decodable>  {

    private let data: Data
    private let response: HTTPURLResponse

    init(data: Data, response: HTTPURLResponse) {
        self.data = data
        self.response = response
    }

    func decode() throws -> T {
        let myStruct = try JSONDecoder().decode(T.self, from: data)
        return myStruct
    }

    func string() -> String {
        return String(decoding: data, as: UTF8.self)
    }
}
