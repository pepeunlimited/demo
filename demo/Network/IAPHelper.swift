//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import StoreKit
import IGListKit
import PromiseKit
import PMKStoreKit

// https://www.raywenderlich.com/5456-in-app-purchase-tutorial-getting-started

class IAPHelper: NSObject {

    func products(productIDs: Set<String>) -> Promise<SKProductsResponse> {
        let req = SKProductsRequest(productIdentifiers: productIDs)
        return firstly {
            req.start(.promise)
        }
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

extension SKProduct: ListDiffable {

    public func diffIdentifier() -> NSObjectProtocol {
        return self.productIdentifier as NSObjectProtocol
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}

protocol SKProductPurchase {

    func isPurchased() -> Bool
}

extension SKProduct: SKProductPurchase  {

    func isPurchased() -> Bool {
        return false
    }
}
