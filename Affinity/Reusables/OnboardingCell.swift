//
//  OnboardingCell.swift
//  Affinity
//
//  Created by Abhishek on 12/12/24.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with item: OnboardingItem) {
        imageView.image = UIImage(named: item.imageName)
        lblTitle.text = item.title
        lblDesc.text = item.subtitle
    }

}
