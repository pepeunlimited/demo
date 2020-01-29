//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class SKProductCell: UICollectionViewCell {

    let price: UILabel = UILabel()

    static let insets: UIEdgeInsets = UIEdgeInsets(top: Stylesheet.Spacing.p1, left: Stylesheet.Spacing.p1, bottom: 0, right: 0)
    static let font: UIFont = Stylesheet.Font.NormalFHeadline

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(price)
        self.backgroundColor = .red
        self.price.font = SKProductCell.font
        self.price.snp.makeConstraints { maker in
            maker.centerY.equalTo(self.contentView)
            maker.left.equalTo(SKProductCell.insets.left)
            maker.top.equalTo(SKProductCell.insets.top)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SKProductCell : ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? SKProductViewModel else { return }
        price.text = viewModel.price.stringValue
    }
}