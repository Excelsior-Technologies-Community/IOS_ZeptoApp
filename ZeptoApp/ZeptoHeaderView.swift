//
//  ZeptoHeaderView.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

class ZeptoHeaderView: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
      @IBOutlet weak var addressLabel: UILabel!
      @IBOutlet weak var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
extension UIView {
    
    static func loadFromNib<T: UIView>() -> T {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! T
    }
}
