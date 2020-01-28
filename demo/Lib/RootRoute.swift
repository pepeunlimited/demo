//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit

protocol Router: class {
    static func showLandingView() -> UIViewController
}

class RootRouter : Router {

    class func showLandingView() -> UIViewController {
        return HomeRoute.assembleModule()
    }
}