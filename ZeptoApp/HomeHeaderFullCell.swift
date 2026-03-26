//
//  HomeHeaderFullCell.swift
//  ZeptoApp
//
//  Created by Noman belim on 24/03/26.
//

import UIKit

struct TabItem {
    let title: String
    let imageName: String
}
class HomeHeaderFullCell: UICollectionViewCell {
    @IBOutlet weak var SecondUIVIew: UIView!
    weak var delegate: HomeHeaderDelegate?
    @IBOutlet weak var seonduiheight: NSLayoutConstraint!
    @IBOutlet weak var heightconstrains: NSLayoutConstraint!
    @IBOutlet weak var searchuiview: UIView!
    @IBOutlet weak var tissueUIView: UIView!
    @IBOutlet weak var FirstUIVIew: UIView!
    // MARK: - Outlets
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var ThirdView: UIView!
    @IBOutlet weak var tissueUI: UIView!
    @IBOutlet weak var searchUI: UIView!
    
    @IBOutlet weak var SecondsUI: UIView!
    
    @IBOutlet weak var offMainUIview: UIView!
    @IBOutlet weak var freshMainUIview: UIView!
    @IBOutlet weak var cafeMainUIview: UIView!
    @IBOutlet weak var zeptoMainUIview: UIView!
    
    @IBOutlet weak var firstItemView: UIView!
    @IBOutlet weak var secondItemView: UIView!
    @IBOutlet weak var thirdItemView: UIView!
    @IBOutlet weak var fourthItemView: UIView!

    var onCategorySelected: ((Int) -> Void)?
    // MARK: - Data
    
    let tabs: [TabItem] = [
        TabItem(title: "All", imageName: "all_icon"),
        TabItem(title: "Sale", imageName: "sale_icon"),
        TabItem(title: "Home", imageName: "home_icon"),
        TabItem(title: "Beauty", imageName: "beauty_icon"),
        TabItem(title: "Dairy", imageName: "dairy_icon")
    ]
    var mainViews: [UIView] {
        return [
            zeptoMainUIview,   // index 0
            offMainUIview,
            cafeMainUIview,    // index 1
            freshMainUIview
                 
        ]
    }

    var itemViews: [UIView] {
        return [
            firstItemView,     // index 0 → Zepto
            secondItemView,    // index 1 → Cafe
            thirdItemView,     // index 2 → Fresh
            fourthItemView     // index 3 → Off
        ]
    }
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        setupCollectionView()
        setupGestures()
        
    }

    // MARK: - UI Setup
    func setupUI() {
        searchuiview.layer.cornerRadius = 10
        tissueUIView.layer.cornerRadius = 10
        // Apply ONLY TOP corner radius
        mainViews.forEach {
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.layer.maskedCorners = [
                .layerMinXMinYCorner,
                .layerMaxXMinYCorner
            ]
        }
    }

    // MARK: - CollectionView Setup
    func setupCollectionView() {
//        collectionview.delegate = self
//        collectionview.dataSource = self
        
//        collectionview.register(UINib(nibName: "TabButtonCell", bundle: nil),
//                                forCellWithReuseIdentifier: "TabButtonCell")
        
//        if let layout = collectionview.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
    }

    // MARK: - Gesture Setup
    func setupGestures() {
        for (index, view) in itemViews.enumerated() {
            view.isUserInteractionEnabled = true
            view.tag = index
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            view.addGestureRecognizer(tap)
        }
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let index = sender.view?.tag else { return }

        print("Selected:", index)

        updateSelection(index: index)

        delegate?.didSelectCategory(index: index) // 🔥 IMPORTANT
    }
    
    func updateSelection(index: Int) {

        print("Selected:", index) // debug

        // Reset
        mainViews.forEach { $0.backgroundColor = .clear }
        itemViews.forEach { $0.backgroundColor = .clear }

        FirstUIVIew.backgroundColor = .clear
        SecondUIVIew.backgroundColor = .clear

        switch index {

        case 0: // Zepto
            print("Zepto selected")
            let light = UIColor(hex: "#B9D7DB")
            let dark = UIColor(hex: "#A1C5C7")

            SecondsUI.backgroundColor = light
            FirstUIVIew.backgroundColor = dark
            SecondUIVIew.backgroundColor = dark
            zeptoMainUIview.backgroundColor = light

        case 1: // Off ✅
            print("Off selected")
            let light = UIColor(hex: "#C4D9FE")
            let dark = UIColor(hex: "#F1F5FE")

            SecondsUI.backgroundColor = light
            FirstUIVIew.backgroundColor = dark
            SecondUIVIew.backgroundColor = dark
            offMainUIview.backgroundColor = light

        case 2: // Cafe
            print("Cafe selected")
            let light = UIColor(hex: "#FDE2AB")
            let dark = UIColor(hex: "#FFF1DA")

            SecondsUI.backgroundColor = light
            FirstUIVIew.backgroundColor = dark
            SecondUIVIew.backgroundColor = dark
            cafeMainUIview.backgroundColor = light

        case 3: // Fresh
            print("Fresh selected")
            let light = UIColor(hex: "#9CE4FE")
            let dark = UIColor(hex: "#DFF6FF")

            SecondsUI.backgroundColor = light
            FirstUIVIew.backgroundColor = dark
            SecondUIVIew.backgroundColor = dark
            freshMainUIview.backgroundColor = light

        default:
            break
        }
    }
}

//
//extension HomeHeaderFullCell: UICollectionViewDelegate,
//                              UICollectionViewDataSource,
//                              UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView,
//                        numberOfItemsInSection section: Int) -> Int {
//        return tabs.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: "TabButtonCell",
//            for: indexPath
//        ) as! TabButtonCell
//
//        cell.button.setTitle(tabs[indexPath.item], for: .normal)
//
//        return cell
//    }
//
//    // Equal width (NO SCROLL)
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width / CGFloat(tabs.count)
//        return CGSize(width: width, height: collectionView.frame.height)
//    }
//}
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
protocol HomeHeaderDelegate: AnyObject {
    func didSelectCategory(index: Int)
}
