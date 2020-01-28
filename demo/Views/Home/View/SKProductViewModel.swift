//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

final class SKProductViewModel: ListDiffable {

    let price: NSDecimalNumber

    init(price: NSDecimalNumber) {
        self.price = price
    }

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
        return Size.calculateTextHeight(width: width, font: Stylesheet.Font.NormalF4, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), text: price.stringValue)
    }

}