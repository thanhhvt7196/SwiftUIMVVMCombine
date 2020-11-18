//
//  MoviePagerList.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import SwiftUI

struct MoviePagerList: UIViewRepresentable {
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
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: geometryProxy.size.width, height: geometryProxy.size.height)
        let collectionView = UICollectionView(frame: CGRect(origin: .zero, size: geometryProxy.size), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: String(describing: MoviePagerCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MoviePagerCollectionViewCell.self))
        let dataSource = UICollectionViewDiffableDataSource<HorizontalCollectionSection, Media>(collectionView: collectionView) { collectionView, indexPath, media -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MoviePagerCollectionViewCell.self), for: indexPath) as? MoviePagerCollectionViewCell
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
