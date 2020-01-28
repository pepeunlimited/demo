//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Atributika
import IGListKit
import StoreKit

class HomeViewController : UIViewController {

    lazy var helper: ListHelper = {
        return ListHelper(vc: self, setConstraints: true)
    }()

    var presenter: HomePresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.StylesheetColor.White
        helper.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
//    func setupUI() {
//        let str = "Buy"
//                .styleAll(Style.font(Stylesheet.Font.NormalFHeadline).foregroundColor(UIColor.StylesheetColor.Black))
//                .attributedString
//
//        self.view.backgroundColor = UIColor.StylesheetColor.White
//        let iap = UIButton(type: .system)
//        iap.setTitleColor(.black, for: .normal)
//        iap.setAttributedTitle(str, for: .normal)
//        self.view.addSubview(iap)
//        iap.snp.makeConstraints { maker in
//            maker.centerX.equalToSuperview()
//            maker.centerY.equalToSuperview()
//        }
//        iap.addTarget(self, action: #selector(onIAPClick), for: .touchUpInside)
//    }
//    @objc func onIAPClick(_ sender: UIButton) {
//        print(Stylesheet.Font.NormalF3)
//    }
}

extension HomeViewController : HomeViewDelegate {

    func showText(text: String) {

    }

    func refresh() {
        self.helper.adapter.performUpdates(animated: true, completion: nil)
    }
}

extension HomeViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let p = presenter else {
            fatalError("missing presenter!")
        }
        return p.objects(for: listAdapter)
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is SKProduct {
            return SKProductViewSectionController()
        }
        fatalError("not supported section controller=\(object)")
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        guard let p = presenter else {
            fatalError("missing presenter!")
        }
        switch p.state() {
        case .idle:
            let emptyView = EmptyView()
            emptyView.text = "Oops, No Product Found!"
            emptyView.retry.isHidden = false
            emptyView.delegate = self
            return emptyView
        case .initial, .loading, .loadingNext:
            return nil
        }
    }
}

extension HomeViewController: EmptyViewDelegate {

    func didTapRetry(view: EmptyView) {
        self.presenter?.fetchIAPProducts()
    }

}