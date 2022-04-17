//
//  GesturesAndAnimationsViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 16.04.2022.
//

import UIKit

class GesturesAndAnimationsViewController: UIViewController {
    
    private lazy var avatarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.green.cgColor
        view.layer.cornerRadius = 75
        return view
    }()
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "deadpool"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Проверка"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.alpha = 0
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(didTapSetStatusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private var avatarViewCenterXConstraint: NSLayoutConstraint?
    private var avatarViewCenterYConstraint: NSLayoutConstraint?
    private var avatarViewHeightConstraint: NSLayoutConstraint?
    private var avatarViewWidthConstraint: NSLayoutConstraint?
    
    private var isExpanded = false
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        title = "Анимация вью"
        
        setupView()
        setConstraints()
        setupGesture()
    }
    
    private func setupView() {
        view.addSubview(testLabel)
        view.addSubview(alphaView)
        view.addSubview(avatarView)
        avatarView.addSubview(avatarImageView)
        view.bringSubviewToFront(alphaView)
        view.addSubview(closeButton)
        view.bringSubviewToFront(avatarView)
        
        avatarViewCenterXConstraint = avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -1 * (screenWidth * 0.5 - 91))
        avatarViewCenterYConstraint = avatarView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -1 * (screenHeight * 0.5 - 166))
        avatarViewHeightConstraint = avatarView.heightAnchor.constraint(equalToConstant: 150)
        avatarViewWidthConstraint = avatarView.widthAnchor.constraint(equalToConstant: 150)
    }
    
    private func setupGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        avatarView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard tapGestureRecognizer === gestureRecognizer else { return }
        
        isExpanded.toggle()
        
        avatarViewCenterXConstraint?.constant = isExpanded ? 0 : -1 * (screenWidth * 0.5 - 91)
        avatarViewCenterYConstraint?.constant = isExpanded ? 0 : -1 * (screenHeight * 0.5 - 166)
        avatarViewHeightConstraint?.constant = isExpanded ? screenWidth : 150
        avatarViewWidthConstraint?.constant = isExpanded ? screenWidth : 150
        
        UIView.animate(withDuration: 0.5) { [self] in
            avatarView.layer.cornerRadius = isExpanded ? 0 : 75
            alphaView.alpha = isExpanded ? 0.7 : 0
            view.layoutIfNeeded()
        } completion: { _ in
        }
        
        if isExpanded {
            alphaView.isHidden = false
            closeButton.isHidden = false
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.5) { [self] in
            closeButton.alpha = isExpanded ? 1 : 0
        } completion: { _ in
        }
    }
    
    @objc private func didTapSetStatusButton() {
        avatarViewCenterXConstraint?.constant = -1 * (screenWidth * 0.5 - 91)
        avatarViewCenterYConstraint?.constant = -1 * (screenHeight * 0.5 - 166)
        avatarViewHeightConstraint?.constant = 150
        avatarViewWidthConstraint?.constant = 150

        UIView.animate(withDuration: 0.5) { [self] in
            avatarView.layer.cornerRadius = 75
            alphaView.alpha = 0
            view.layoutIfNeeded()
        } completion: { _ in
        }

        closeButton.alpha = 0
        closeButton.isHidden = false
        isExpanded = false
        }
    }


extension GesturesAndAnimationsViewController {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            avatarViewCenterXConstraint,
            avatarViewCenterYConstraint,
            avatarViewHeightConstraint,
            avatarViewWidthConstraint
        ].compactMap({ $0 }))

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            testLabel.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            alphaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
