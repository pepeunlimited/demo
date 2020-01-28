//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import StoreKit
import IGListKit

// https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started
class IAPHelper: NSObject {

    private let productIdentifiers: Set<String>

    public init(productIds: Set<String>) {
        self.productIdentifiers = productIds
        super.init()
    }
}

extension IAPHelper {

    func products() {

    }

    func buy(_ product: SKProduct) {}

    func isPurchased(_ productId: String) -> Bool {
        return false
    }

    func isPaymentPossible() -> Bool {
        return true
    }

    func restore() {}
}

extension IAPHelper: SKProductsRequestDelegate {

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

    }

}

extension SKProduct: ListDiffable {

    public func diffIdentifier() -> NSObjectProtocol {
        return productIdentifier as NSObjectProtocol
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SKProduct else  { return false }
        return productIdentifier == object.productIdentifier
    }
}