//
//  SliderImageCell.swift
//  Oreo Fashion
//
//  Created by AALA mac on 13/10/2023.
//

import UIKit

class SliderImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewGoBtn: UIView!
    @IBAction func goBtn(_ sender: Any) {
    }
    static let identifier = "SliderImageCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewGoBtn.layer.cornerRadius = viewGoBtn.bounds.height/2
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "SliderImageCell", bundle: nil)
    }
    
    func configure(with model: Model){
        imageView.image = UIImage(named: model.imageName)
    }

}
