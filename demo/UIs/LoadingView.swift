//
// Created by Simo Ala-Kotila on 29.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView {

    private let indicator = UIActivityIndicatorView(style: .gray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        indicator.startAnimating()
        addSubview(indicator)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }

    func setConstraints() {
        indicator.center = CGPoint(x: bounds.width/2, y: bounds.height/2)
    }
}