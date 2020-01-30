//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import StoreKit

protocol HomeViewDelegate: class {

    func refresh(_ state: NetworkState)
}

protocol HomeInteractorInput: class {

    // product identifiers which are set to Apple's Store
    func loadSKProducts(_ productIDs: Set<String>)
}

protocol HomeInteractorOutput: class {

    func loadedSKProducts(_ products: [SKProduct])
}

protocol HomePresenterDelegate: BindObjects {
    func viewDidLoad()
    func skproducts(_ productIds: Set<String>)
    func skproducts()
}