//
//  HomeBannerSectionCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 02/04/26.
//

import UIKit

class HomeBannerSectionCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    var banners: [BannerItem] = [
        BannerItem(imageName: "Banner"),
        BannerItem(imageName: "Banner1"),
        BannerItem(imageName: "Banner2"),
        BannerItem(imageName: "Banner3"),
        BannerItem(imageName: "Banner4"),
        BannerItem(imageName: "Banner5"),
        BannerItem(imageName: "Banner7"),
        BannerItem(imageName: "Banner8")
    ]

    override func awakeFromNib() {
        super.awakeFromNib()

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.register(
            UINib(nibName: "BannerCell", bundle: nil),
            forCellWithReuseIdentifier: "BannerCell"
        )

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
extension HomeBannerSectionCell: UICollectionViewDelegate,
                                 UICollectionViewDataSource,
                                 UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let cellWidthIncludingSpacing = (collectionView.frame.width * 0.8) + layout.minimumLineSpacing

        let offset = targetContentOffset.pointee.x
        let index = round(offset / cellWidthIncludingSpacing)

        let newOffset = index * cellWidthIncludingSpacing
        targetContentOffset.pointee = CGPoint(x: newOffset, y: 0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let distance = abs(collectionView.center.x - cell.center.x)
            let scale = max(0.85, 1 - (distance / collectionView.frame.width))

            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BannerCell",
            for: indexPath
        ) as! BannerCell

        cell.configure(image: banners[indexPath.item].imageName)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       insetForSectionAt section: Int) -> UIEdgeInsets {

        let sideInset = (collectionView.frame.width * 0.2) / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width * 0.8
        let height = collectionView.frame.height

        return CGSize(width: width, height: height)
    }
  
}
