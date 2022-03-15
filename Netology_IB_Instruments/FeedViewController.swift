//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(frame: CGRect(x: 20, y: 700, width: 350, height: 57))
        button.backgroundColor = .orange
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Перейти на пост", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    @objc func didTapButton(_ sender: UIButton!) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
}
