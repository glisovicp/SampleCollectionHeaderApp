//
//  CollectionHeaderView.swift
//  SampleCollectionHeaderApp
//
//  Created by Petar Glisovic on 3/7/21.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {

    // MARK: - Outlets
    
    @IBOutlet weak var headerTitleLbl: UILabel!
    @IBOutlet weak var headerSubtittleLbl: UILabel!
    @IBOutlet weak var headerBtn: UIButton!
    @IBOutlet weak var headerIv: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commonInit()
    }
    
    func commonInit() {
        setupViews()
    }
    
    func setupViews() {
        self.headerIv.backgroundColor = UIColor.systemBlue
        self.headerBtn.backgroundColor = UIColor.darkGray
        self.headerBtn.setTitleColor(UIColor.systemGray3, for: .normal)
    }
    
    @IBAction func headerBtnPTapped(_ sender: Any) {
        print("Tapped on button in header view")
    }
    
}
