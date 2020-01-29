//
// Created by Simo Ala-Kotila on 28.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class ListHelper : NSObject {

    let loadingView: LoadingView
    let collectionView: UICollectionView
    let adapter: ListAdapter

    let setConstraints: Bool

    init(vc: UIViewController, setConstraints: Bool) {
        self.setConstraints = setConstraints
        self.adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: vc, workingRangeSize: 0)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: ListCollectionViewLayout(stickyHeaders: false, scrollDirection: .vertical, topContentInset: 0, stretchToEdge: true))
        self.loadingView = LoadingView()
        super.init()
        setCollectionView()
        setIGListKit()
    }

    private func setCollectionView() {
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = UIColor.StylesheetColor.White
        self.collectionView.keyboardDismissMode = .onDrag
    }

    private func setIGListKit() {
        adapter.collectionView = collectionView
    }

    private func setCollectionViewConstraint(view: UIView) {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setLoadingView(view: UIView) {
        view.addSubview(loadingView)
        loadingView.isHidden = false
        loadingView.snp.makeConstraints { maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func viewDidLoad() {
        guard let view = adapter.viewController?.view else { return }
        if setConstraints {
            setCollectionViewConstraint(view: view)
            setLoadingView(view: view)
        }
    }
}