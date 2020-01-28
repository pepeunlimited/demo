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
}

extension HomePresenter: HomePresenterDelegate {

    func fetchIAPProducts() {
        print("fetchIAPProducts")
        self.interactor?.load()
    }

    func state() -> NetworkState {
        return networkState
    }

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return []
    }

    func iap() {

    }

    func viewDidLoad() {
        self.interactor?.load()
    }
}

extension HomePresenter: HomeInteractorOutput {
    func loaded() {
        self.networkState = .idle
        self.view?.showText(text: "loaded")
        self.view?.refresh()
    }
}