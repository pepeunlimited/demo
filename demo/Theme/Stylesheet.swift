//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    struct StylesheetColor {
        static let Black = UIColor(rgb: 0x000000)
        static let White = UIColor(rgb: 0xFFFFFF)
    }
}

struct Stylesheet {

    public struct Spacing {
        static let p0: CGFloat = 0
        static let p1: CGFloat = 10
    }

    public struct Height {
        static let xs: CGFloat  = 10
        static let s: CGFloat   = 10
        static let m: CGFloat   = 10
        static let l: CGFloat   = 10
        static let xl: CGFloat  = 100
    }

    /* factors */
    public struct TypeScale {
        static let fHeadline: CGFloat          = 35
        static let fSubheadline: CGFloat       = 21
        static let f1: CGFloat                 = 15
        static let f2: CGFloat                 = 11
        static let f3: CGFloat                 = 7
        static let f4: CGFloat                 = 5
        static let f5: CGFloat                 = 3
        static let f6: CGFloat                 = 1
    }

    public struct FontWeight {
        static let normal: UIFont.Weight       = UIFont.Weight.medium
        static let bold: UIFont.Weight         = UIFont.Weight.semibold
        static let w700: UIFont.Weight         = UIFont.Weight.black
        static let w600: UIFont.Weight         = UIFont.Weight.heavy
        static let w500: UIFont.Weight         = UIFont.Weight.bold
        static let w400: UIFont.Weight         = UIFont.Weight.medium
        static let w300: UIFont.Weight         = UIFont.Weight.light
        static let w200: UIFont.Weight         = UIFont.Weight.thin
        static let w100: UIFont.Weight         = UIFont.Weight.ultraLight
    }

    public struct Font {

        static let NormalFHeadline: UIFont    = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.fHeadline, weight: Stylesheet.FontWeight.normal)
        static let NormalFSubheadline: UIFont = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.fSubheadline, weight: Stylesheet.FontWeight.normal)
        static let NormalF1: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f1, weight: Stylesheet.FontWeight.normal)
        static let NormalF2: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f2, weight: Stylesheet.FontWeight.normal)
        static let NormalF3: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f3, weight: Stylesheet.FontWeight.normal)
        static let NormalF4: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f4, weight: Stylesheet.FontWeight.normal)
        static let NormalF5: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f5, weight: Stylesheet.FontWeight.normal)
        static let NormalF6: UIFont           = UIFont.systemFont(ofSize: size()+Stylesheet.TypeScale.f6, weight: Stylesheet.FontWeight.normal)

        private static func size() -> CGFloat {
            return UIFontDescriptor.preferredFontDescriptor(withTextStyle: .caption2).pointSize
        }
    }
}