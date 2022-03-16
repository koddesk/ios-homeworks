//
//  PostViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 14.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Мой пост"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonIcon = UIImage(systemName: "info.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))
        let rightBarButton = UIBarButtonItem(title: "Info",
                                             style: .plain,
                                             target: self,
                                             action: #selector(show))
        rightBarButton.image = buttonIcon
        self.navigationItem.rightBarButtonItem = rightBarButton
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .systemOrange
        self.navigationItem.title = titlePost
    }
    
    @objc func show(_ vc: PostViewController, sender: Any?) {
        present(InfoViewController(), animated: true)
    }
}
