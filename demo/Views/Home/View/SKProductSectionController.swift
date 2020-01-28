//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
import StoreKit

// should bind section controller per one model
class SKProductViewSectionController: ListBindingSectionController<ListDiffable>,
                                      ListBindingSectionControllerDataSource {

    override init() {
        super.init()
        self.dataSource = self
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let product = object as? SKProduct else { fatalError("not supported object=\(object)") }
        let viewModels: [ListDiffable] = [SKProductViewModel(price: product.price)]
        return viewModels
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let cellClass: AnyClass
        switch viewModel {
        case is SKProductViewModel: cellClass = SKProductCell.self
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
//        case is SKProductViewModel: height = Stylesheet.Height.xs                                           // fixed
        default: height = Stylesheet.Height.xs                                                              // fixed
        }
        return CGSize(width: ctx.width, height: height)
    }
}