//
//  MovieCollectionItemCell.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/16/20.
//

import UIKit
import SDWebImage

class MovieCollectionItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configCell(media: Media) {
        let url = ImageHelper.shared.pathToURL(path: media.posterPath, imageSize: .w200)
        imageView.sd_setImage(with: url, completed: nil)
        imageView.sd_imageTransition = .fade(duration: 0.2)
    }

}
