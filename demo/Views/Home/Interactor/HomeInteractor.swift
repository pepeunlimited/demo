//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import StoreKit
import IGListKit
import PromiseKit
import PMKStoreKit

class HomeInteractor {

    weak var output: HomeInteractorOutput?

    let helper = IAPHelper()
}

extension HomeInteractor : HomeInteractorInput {

    func loadSKProducts(_ productIDs: Set<String>) {
        firstly {
            Auth.authentication(host: "https://httpbin.org/get")
                    .login(usernameOrEmail: "simothemaster", password: "p4ssw04rd")
                    .start(.promise)
        }
        .compactMap {
            try $0.decode()
        }.compactMap {
            print($0.origin)
        }
        .then {
            self.helper.products(productIDs: productIDs)
        }.done {
            self.output?.loadedSKProducts($0.products)
        }.catch {
            print($0)
            self.output?.failureSKProducts()
        }
    }
}
