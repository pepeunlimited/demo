//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import PromiseKit
import PMKStoreKit

class HomeInteractor {

    weak var output: HomeInteractorOutput?

    let helper = IAPHelper()
}

extension HomeInteractor : HomeInteractorInput {

    func loadIAPProducts(_ productIDs: Set<String>) {
        firstly {
            helper.products(productIDs: productIDs)
        }.done {
            self.output?.loadedIAPProducts($0.products)
        }.catch {
            print($0)
        }
    }
}
