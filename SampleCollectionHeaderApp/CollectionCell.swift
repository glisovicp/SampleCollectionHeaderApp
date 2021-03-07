//
//  CollectionCell.swift
//  SampleCollectionHeaderApp
//
//  Created by Petar Glisovic on 3/7/21.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commonInit()
    }

    func commonInit() {
        setupViews()
    }
    
    func setupViews() {
        
    }
}
