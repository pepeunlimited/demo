//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit

protocol HomeViewDelegate: class {

    func showText(text: String)

    func refresh()
}

protocol HomeInteractorInput: class {
    func load()
}

protocol HomeInteractorOutput: class {

    func loaded()
}

protocol HomePresenterDelegate: BindObjects {
    func viewDidLoad()
    func iap()
    func fetchIAPProducts()
}