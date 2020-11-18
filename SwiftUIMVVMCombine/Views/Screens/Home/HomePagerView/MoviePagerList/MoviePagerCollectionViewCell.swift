//
//  MoviePagerCollectionViewCell.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/18/20.
//

import UIKit

class MoviePagerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backdropImageView.backgroundColor = .clear
    }
    
    func configCell(media: Media) {
        backdropImageView.sd_setImage(with: ImageHelper.shared.pathToURL(path: media.backdropPath, imageSize: .w300))
        titleLabel.text = media.title
        descriptionLabel.text = MovieHelper.getGenresString(media: media)
    }
}
