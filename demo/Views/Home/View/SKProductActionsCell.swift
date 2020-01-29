//
// Created by Simo Ala-Kotila on 29.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit
import Atributika

class SKProductActionsCell : UICollectionViewCell {

    let button = UIButton(type: .system)

    static let font: UIFont = Stylesheet.Font.NormalFHeadline

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .green
        let str = "Buy"
                .styleAll(Style.font(SKProductActionsCell.font).foregroundColor(UIColor.StylesheetColor.Black))
                .attributedString
        button.setTitleColor(.black, for: .normal)
        button.setAttributedTitle(str, for: .normal)
        self.contentView.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        button.addTarget(self, action: #selector(onIAPClick), for: .touchUpInside)
    }

    @objc func onIAPClick(_ sender: UIButton) {
        print("BUY!")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SKProductActionsCell: ListBindable {

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? SKProductActionsViewModel else { return }
        button.isEnabled = !viewModel.isPurchased
    }
}