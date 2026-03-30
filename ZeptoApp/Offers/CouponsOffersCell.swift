//
//  CouponsOffersCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 27/03/26.
//

import UIKit


class CouponsOffersCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        collectionView.collectionViewLayout = layout

        collectionView.register(UINib(nibName: "TopCouponCell", bundle: nil),
                                forCellWithReuseIdentifier: "TopCouponCell")

        collectionView.register(UINib(nibName: "OfferSliderCell", bundle: nil),
                                forCellWithReuseIdentifier: "OfferSliderCell")
    }
}

extension CouponsOffersCell: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: "TopCouponCell",
                for: indexPath
            )
        }

        return collectionView.dequeueReusableCell(
            withReuseIdentifier: "OfferSliderCell",
            for: indexPath
        )
    }
}
extension CouponsOffersCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width

        if indexPath.item == 0 {
            return CGSize(width: width, height: 130) // top 4 cards
        }

        return CGSize(width: width, height: 120) // slider
    }
}
