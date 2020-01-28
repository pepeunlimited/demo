//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation

class HomeInteractor {

    weak var output: HomeInteractorOutput?
}

extension HomeInteractor : HomeInteractorInput {
    func load() {
        output?.loaded()
    }
}
