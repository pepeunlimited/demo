//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

protocol BindObjects {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable]

    func state() -> NetworkState
}

enum NetworkState {
    case initial
    case loading
    case loadingNext
    case idle
    case failure
}