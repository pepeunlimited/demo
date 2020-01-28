//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit

final class Size {

    static func calculateTextHeight(width: CGFloat, font: UIFont, insets: UIEdgeInsets, text: String) -> CGFloat {
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [ NSAttributedString.Key.font: font ]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(bounds.height) + insets.top + insets.bottom
    }

    static func singleLineHeight(_ font: UIFont, insets: UIEdgeInsets) -> CGFloat {
        return font.lineHeight + insets.top + insets.bottom
    }
}

protocol Heightable {

    func height(width: CGFloat) -> CGFloat
}