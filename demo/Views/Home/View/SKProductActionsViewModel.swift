//
// Created by Simo Ala-Kotila on 29.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit


final class SKProductActionsViewModel {

    let isPurchased: Bool

    init(isPurchased: Bool) {
        self.isPurchased = isPurchased
    }

}

extension SKProductActionsViewModel : ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return "SKProductActionsViewModel" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SKProductActionsViewModel else { return false }
        return isPurchased == object.isPurchased
    }

}