//
//  InfoViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 15.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        let button = UIButton(frame: CGRect(x: 20, y: 700, width: 350, height: 57))
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.setTitle("Перейти на пост", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func didTapButton(_ sender: UIButton!) {
        let alertController = UIAlertController(title: "Внимание, что то важное", message: "Скоро", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (action) in
        }
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("Скоро")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        present(alertController, animated: true)
    }
}


