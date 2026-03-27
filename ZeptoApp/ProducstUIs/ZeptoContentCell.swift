//
//  ZeptoContentCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 26/03/26.
//

import UIKit

class ZeptoContentCell: UICollectionViewCell {
    

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
          collectionView.register(
              UINib(nibName: "ZeptoProductsTopPartCell", bundle: nil),
              forCellWithReuseIdentifier: "ZeptoProductsTopPartCell"
          )

          
          collectionView.register(
              UINib(nibName: "ZeptoGridCell", bundle: nil),
              forCellWithReuseIdentifier: "ZeptoGridCell"
          )
        
    }

}
extension ZeptoContentCell: UICollectionViewDelegate,
                            UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        if section == 0 {
            return 1 // horizontal part
        } else {
            return 6 // grid items
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ZeptoProductsTopPartCell",
                for: indexPath
            )

            return cell
        } else {

            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "ZeptoGridCell",
                for: indexPath
            )

            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width

        if indexPath.section == 0 {
            return CGSize(width: width, height: 590)
        } else {
            return CGSize(width: width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
