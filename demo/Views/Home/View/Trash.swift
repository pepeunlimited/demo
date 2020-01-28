//
// Created by Simo Ala-Kotila on 29.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

//func setupUI() {
//    self.view.backgroundColor = UIColor.StylesheetColor.White
//
//    let str = "Buy"
//            .styleAll(Style.font(Stylesheet.Font.NormalFHeadline).foregroundColor(UIColor.StylesheetColor.Black))
//            .attributedString
//
//    self.view.backgroundColor = UIColor.StylesheetColor.White
//    let iap = UIButton(type: .system)
//    iap.setTitleColor(.black, for: .normal)
//    iap.setAttributedTitle(str, for: .normal)
//    self.view.addSubview(iap)
//    iap.snp.makeConstraints { maker in
//        maker.centerX.equalToSuperview()
//        maker.centerY.equalToSuperview()
//    }
//    iap.addTarget(self, action: #selector(onIAPClick), for: .touchUpInside)
//}
//@objc func onIAPClick(_ sender: UIButton) {
//    print(Stylesheet.Font.NormalF3)
//}