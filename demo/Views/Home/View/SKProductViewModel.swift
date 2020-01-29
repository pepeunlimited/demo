//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class SKProductViewModel {

    let price: NSDecimalNumber

    init(price: NSDecimalNumber) {
        self.price = price
    }

}

extension SKProductViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return "SKProductViewModel" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SKProductViewModel else  { return false }
        return price == object.price
    }
}

extension SKProductViewModel: Heightable {

    func height(width: CGFloat) -> CGFloat {
        return Size.calculateTextHeight(width: width, font: SKProductCell.font, insets: SKProductCell.insets, text: price.stringValue)
    }
}