//
//  ViewController.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

class ViewController: UIViewController {
  

    
    @IBOutlet weak var Collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterXibs()
        
    }

    func RegisterXibs(){
        Collectionview.delegate = self
        Collectionview.dataSource = self
        Collectionview.register(UINib(nibName: "ZeptoHeaderView", bundle: nil),  forCellWithReuseIdentifier: "ZeptoHeaderView")
    }
}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZeptoHeaderView", for: indexPath) as! ZeptoHeaderView

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }

}
