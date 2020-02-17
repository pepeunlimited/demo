//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
import StoreKit


protocol SKProductViewDelegate : class {


}

// should bind section controller per one model
class SKProductViewSectionController: ListBindingSectionController<ListDiffable>,
                                      ListBindingSectionControllerDataSource {

    weak var delegate: SKProductViewDelegate?

    override init() {
        super.init()
        self.dataSource = self
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let product = object as? SKProduct else { fatalError("not supported object=\(object)") }
        let price = 0.64 as NSDecimalNumber
        let viewModels: [ListDiffable] = [SKProductViewModel(price: price),
                                          SKProductActionsViewModel(isPurchased: product.isPurchased())]
        return viewModels
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let cellClass: AnyClass
        switch viewModel {
        case is SKProductViewModel: cellClass = SKProductCell.self
        case is SKProductActionsViewModel: cellClass = SKProductActionsCell.self
        default: fatalError("not supported viewModel \(viewModel)")
        }
        guard let cell = sectionController.collectionContext?.dequeueReusableCell(of: cellClass, for: sectionController, at: index) as? UICollectionViewCell & ListBindable else { fatalError("cell is not bindable") }
        return cell
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let ctx = sectionController.collectionContext?.containerSize else { fatalError("missing context") }
        let height: CGFloat
        switch viewModel {
        case let viewModel as SKProductViewModel: height = viewModel.height(width: ctx.width)               // dynamic
//        case is SKProductActionsViewModel: height = Stylesheet.Height.xl                                    // fixed
        case is SKProductActionsViewModel: height = SKProductActionsCell.font.pointSize
        default: height = Stylesheet.Height.xs                                                              // fixed
        }
        return CGSize(width: ctx.width, height: height)
    }
}