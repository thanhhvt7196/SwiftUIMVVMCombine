//
//  HorizontalCollectionView.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import Foundation
import SwiftUI

enum HorizontalCollectionSection {
    case main
}

struct HorizontalCollectionView: UIViewRepresentable {
    private let mediaList: [Media]
    private let geometryProxy: GeometryProxy
    
    init(mediaList: [Media], geometry: GeometryProxy) {
        self.mediaList = mediaList
        self.geometryProxy = geometry
    }
    
    class MyCoordinator {
        var dataSource: UICollectionViewDiffableDataSource<HorizontalCollectionSection, Media>?
    }
    
    func makeCoordinator() -> MyCoordinator {
        return MyCoordinator()
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: geometryProxy.size.height/1.5, height: geometryProxy.size.height)
        let collectionView = UICollectionView(frame: CGRect(origin: .zero, size: geometryProxy.size), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: String(describing: MovieCollectionItemCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MovieCollectionItemCell.self))
        let dataSource = UICollectionViewDiffableDataSource<HorizontalCollectionSection, Media>(collectionView: collectionView) { collectionView, indexPath, media -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCollectionItemCell.self), for: indexPath) as? MovieCollectionItemCell
            cell?.configCell(media: media)
            return cell
        }
        context.coordinator.dataSource = dataSource
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        guard let dataSource = context.coordinator.dataSource else {
            return
        }
        populate(dataSource: dataSource)
    }
    
    func populate(dataSource: UICollectionViewDiffableDataSource<HorizontalCollectionSection, Media>) {
        var snapShot = NSDiffableDataSourceSnapshot<HorizontalCollectionSection, Media>()
        snapShot.appendSections([.main])
        snapShot.appendItems(mediaList)
        dataSource.apply(snapShot)
    }
}
