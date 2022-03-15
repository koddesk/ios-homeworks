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
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .orange
        self.navigationItem.title = titlePost
    }
    
    
}
