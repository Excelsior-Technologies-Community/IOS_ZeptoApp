//
//  OfferSliderCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 30/03/26.
//

import UIKit

class OfferSliderCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        collectionView.collectionViewLayout = layout

        collectionView.register(UINib(nibName: "OfferItemCell", bundle: nil),
                                forCellWithReuseIdentifier: "OfferItemCell")
    }
}
extension OfferSliderCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(
            withReuseIdentifier: "OfferItemCell",
            for: indexPath
        )
    }
}
extension OfferSliderCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width - 40, height: 100)
    }
}
