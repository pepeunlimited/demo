//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit

class HomeRoute {

    weak var vc: UIViewController?

    static func assembleModule() -> UIViewController {
        let vc = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let route = HomeRoute()

        // set presenter for VC
        vc.presenter = presenter

        // set datasource for IGListKit
        vc.helper.adapter.dataSource = vc

        // set interactor for output
        interactor.output = presenter

        // set vc for route
        route.vc = vc

        // set route, interactor and view for presenter
        presenter.interactor = interactor
        presenter.route = route
        presenter.view = vc
        return vc
    }
}