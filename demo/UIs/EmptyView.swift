//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol EmptyViewDelegate: class {
    func didTapRetry(view: EmptyView)
}

final class EmptyView: UIView {

    private let title = UILabel()
    let retry = UIButton(type: .system)

    weak var delegate: EmptyViewDelegate?

    var text: String? {
        get {
            return title.text
        }
        set {
            title.text = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle()
        setRetryButton()
    }

    private func setTitle() {
        title.backgroundColor = .clear
        title.textAlignment = .center
        title.font = Stylesheet.Font.NormalF5
        title.textColor = UIColor.StylesheetColor.Black
        title.numberOfLines = 0
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
        }
    }

    private func setRetryButton() {
        retry.isHidden = true
        retry.titleLabel?.font = Stylesheet.Font.NormalF3
        retry.setTitle("Try Again", for: .normal)
        retry.setTitleColor(UIColor.StylesheetColor.Black, for: .normal)
        retry.addTarget(self, action: #selector(tapRetry), for: .touchUpInside)
        addSubview(retry)
        retry.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(title).offset(Stylesheet.Spacing.p1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func tapRetry(sender: UIButton) {
        delegate?.didTapRetry(view: self)
    }
}