//
//  GalleryCustomCellTableViewCell.swift
//  Projecto-2
//
//  Created by Fredy asencios on 27/03/22.
//

import UIKit

class GalleryCustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePicCell: UIImageView!
    @IBOutlet weak var nombrePicLbl: UILabel!
    @IBOutlet weak var fechaPicLbl: UILabel!
    @IBOutlet weak var descripPicLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagePicCell.layer.cornerRadius = 10
        imagePicCell.layer.borderColor = UIColor.lightGray.cgColor
        imagePicCell.layer.borderWidth = 0.5
        imagePicCell.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
