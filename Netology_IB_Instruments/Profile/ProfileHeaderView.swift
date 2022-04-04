//
//  ProfileHeaderView.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 17.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    lazy var avatarView: UIImageView = {
        let avatarView = UIImageView()
        avatarView.image = UIImage(named: "deadpool")
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.cornerRadius = 50
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.text = "Deadpool"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = .systemFont(ofSize: 14)
        statusLabel.text = "Пора заворачивать чимичанги!"
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 12
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4.0)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowPath = UIBezierPath(rect: statusButton.bounds).cgPath
        statusButton.layer.shouldRasterize = true
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = .systemBlue
        return statusButton
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(statusLabel)
        addSubview(avatarView)
        addSubview(statusButton)
        addSubview(nameLabel)
        
        let avatarViewLeadingConstraint = avatarView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let avatarViewTopConstraint = avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        let avatarViewHeightConstraint = avatarView.heightAnchor.constraint(equalToConstant: 100)
        let avatarViewWidthConstraint = avatarView.widthAnchor.constraint(equalToConstant: 100)
        
        let nameLabelTopConstraint = nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27)
        let nameLabelLeadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20)
        
        let statusButtonLeadingConstraint = statusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let statusButtonCenterXConstraint = statusButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        let statusButtonTopConstraint = statusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 16)
        let statusButtonHeightConstraint = statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        let statusLabelBottomConstraint = statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
        let statusLabelLeadingConstraint = statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        
        NSLayoutConstraint.activate([avatarViewLeadingConstraint,
                                     avatarViewTopConstraint,
                                     avatarViewHeightConstraint,
                                     avatarViewWidthConstraint,
                                     nameLabelTopConstraint,
                                     nameLabelLeadingConstraint,
                                     statusButtonLeadingConstraint,
                                     statusButtonCenterXConstraint,
                                     statusButtonTopConstraint,
                                     statusButtonHeightConstraint,
                                     statusLabelBottomConstraint,
                                     statusLabelLeadingConstraint,
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed() {
        guard let status = statusLabel.text else { return }
        print(status)
    }
}
