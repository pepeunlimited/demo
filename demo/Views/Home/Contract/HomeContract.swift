//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import StoreKit

protocol HomeViewDelegate: class {

    func showText(text: String)

    func refresh(_ state: NetworkState)
}

protocol HomeInteractorInput: class {

    // product identifiers which are set to Apple's Store
    func loadIAPProducts(_ productIDs: Set<String>)
}

protocol HomeInteractorOutput: class {

    func loadedIAPProducts(_ products: [SKProduct])
}

protocol HomePresenterDelegate: BindObjects {
    func viewDidLoad()
    func iap()
    func fetchIAPProducts()
}