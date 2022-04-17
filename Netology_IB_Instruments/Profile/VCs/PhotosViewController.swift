//
//  PhotosViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 12.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private enum Constants {
        static let itemCount: CGFloat = 3
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let idPhotosCollectionViewCell = "idPhotosCollectionViewCell"
    
    private var collectionDataSource: [PhotosCollectionView] = [
        PhotosCollectionView(image: "1"),
        PhotosCollectionView(image: "2"),
        PhotosCollectionView(image: "3"),
        PhotosCollectionView(image: "4"),
        PhotosCollectionView(image: "5"),
        PhotosCollectionView(image: "6"),
        PhotosCollectionView(image: "7"),
        PhotosCollectionView(image: "8"),
        PhotosCollectionView(image: "9"),
        PhotosCollectionView(image: "10"),
        PhotosCollectionView(image: "11"),
        PhotosCollectionView(image: "12"),
        PhotosCollectionView(image: "13"),
        PhotosCollectionView(image: "14"),
        PhotosCollectionView(image: "15"),
        PhotosCollectionView(image: "16"),
        PhotosCollectionView(image: "17"),
        PhotosCollectionView(image: "18"),
        PhotosCollectionView(image: "19"),
        PhotosCollectionView(image: "20")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setDelegates()
    }
    
    private func setupView() {
        title = "Photo Gallery"
        navigationController?.navigationBar.isHidden = false
        
        view.addSubview(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: idPhotosCollectionViewCell)
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idPhotosCollectionViewCell, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        let photos = collectionDataSource[indexPath.row]
        cell.photoGalleryImages.image = UIImage(named: photos.image)
        cell.photoGalleryImages.contentMode = .scaleAspectFill
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController:  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
}

//MARK: - SetConstraints

extension PhotosViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
