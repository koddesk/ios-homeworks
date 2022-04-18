//
//  FeedViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 14.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.setTitle("Перейти на пост", for: .normal)
        firstButton.backgroundColor = .systemOrange
        firstButton.layer.cornerRadius = 12
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        firstButton.layer.shadowRadius = 4
        firstButton.layer.shadowOpacity = 0.7
        firstButton.layer.shadowPath = UIBezierPath(rect: firstButton.bounds).cgPath
        firstButton.layer.shouldRasterize = true
        firstButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        return firstButton
    }()
    
    lazy var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.setTitle("Перейти на пост", for: .normal)
        secondButton.backgroundColor = .systemGreen
        secondButton.layer.cornerRadius = 12
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        secondButton.layer.shadowRadius = 4
        secondButton.layer.shadowOpacity = 0.7
        secondButton.layer.shadowPath = UIBezierPath(rect: secondButton.bounds).cgPath
        secondButton.layer.shouldRasterize = true
        secondButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        return secondButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        drawSelf()
    }
    
    private func drawSelf() {
        
        let stackViewCenterYConstraint = stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let stackViewLeadingConstraint = stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        let stackViewTrailingConstraint = stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        let stackViewHeightConstraint = stackView.heightAnchor.constraint(equalToConstant: 110)
        
        NSLayoutConstraint.activate([
            stackViewCenterYConstraint,
            stackViewLeadingConstraint,
            stackViewTrailingConstraint,
            stackViewHeightConstraint
        ])
    }
    
    @objc func didTapButton(_ sender: UIButton!) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
