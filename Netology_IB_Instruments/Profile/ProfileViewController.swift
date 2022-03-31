//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 14.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var newButton: UIButton = {
            let newButton = UIButton()
            newButton.setTitle("Новая кнопка", for: .normal)
            newButton.setTitleColor(.white, for: .normal)
            newButton.backgroundColor = .systemBlue
            newButton.layer.cornerRadius = 12
            newButton.translatesAutoresizingMaskIntoConstraints = false
            return newButton
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = .white
        view.addSubview(profileHeaderView)
        view.addSubview(newButton)
        
        let profileHeaderViewTopConstraint = profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let profileHeaderViewLeadingConstraint = profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let profileHeaderViewTrailingConstraint = profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let profileHeaderViewHeightConstraint = profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        let newButtonBottomConstraint = newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let newButtonLeadingConstraint = newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let newButtonTrailingConstraint = newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let newButtonHeightConstraint = newButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            profileHeaderViewTopConstraint,
            profileHeaderViewLeadingConstraint,
            profileHeaderViewTrailingConstraint,
            profileHeaderViewHeightConstraint,
            newButtonBottomConstraint,
            newButtonLeadingConstraint,
            newButtonTrailingConstraint,
            newButtonHeightConstraint
        ])
    }
}
