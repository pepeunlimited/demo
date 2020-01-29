//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import StoreKit
class HomePresenter : NSObject {

    //reference to the view (weak to avoid retain cycle)
    weak var view: HomeViewDelegate?

    //reference to input (to server)
    var interactor: HomeInteractorInput?

    //reference to route
    var route: HomeRoute?

    var networkState: NetworkState = .initial

    
    var objects: [ListDiffable] = []
    
}

extension HomePresenter: HomePresenterDelegate {

    func fetchIAPProducts() {
        let productIds: Set<String> = ["something"]
        self.networkState = .loading
        self.view?.refresh(networkState)
        self.interactor?.loadIAPProducts(productIds)
    }

    func state() -> NetworkState {
        return networkState
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }

    func iap() {

    }

    func viewDidLoad() {
        let productIds: Set<String> = ["something"]
        self.networkState = .loading
        self.view?.refresh(networkState)
        self.interactor?.loadIAPProducts(productIds)
    }
}

extension HomePresenter: HomeInteractorOutput {
    func loadedIAPProducts(_ products: [SKProduct]) {
        objects = [SKProduct()]
        self.networkState = .idle
        self.view?.refresh(networkState)
    }
}