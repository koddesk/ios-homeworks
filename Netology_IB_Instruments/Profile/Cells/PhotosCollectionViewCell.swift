//
//  PhotosCollectionViewCell.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 12.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var photoGalleryImages: UIImageView = {
        let photoGalleryImages = UIImageView()
        photoGalleryImages.clipsToBounds = true
        photoGalleryImages.translatesAutoresizingMaskIntoConstraints = false
        return photoGalleryImages
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(photoGalleryImages)
    }
}

//MARK: - SetConstraints

extension PhotosCollectionViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            photoGalleryImages.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoGalleryImages.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoGalleryImages.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            photoGalleryImages.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
