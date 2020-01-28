//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class SKProductCell: UICollectionViewCell, ListBindable {

    let price: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(price)
        self.price.snp.makeConstraints { maker in
            maker.centerY.equalTo(self.contentView)
            maker.left.equalTo(Stylesheet.Spacing.p1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? SKProductViewModel else { return }
        price.text = viewModel.price.stringValue
    }
}