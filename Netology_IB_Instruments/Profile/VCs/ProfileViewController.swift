//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 14.03.2022.
//

import UIKit

class ProfileViewController: UIViewController, TapLikeDelegate {
    
    private lazy var profileHeaderView = ProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var liked: Bool = false
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    private let idPhotosTableViewCell = "idPhotosTableViewCell"
    private let idPostTableViewCell = "idPostTableViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Профиль"
        
        setupView()
        setConstraints()
        setDelegates()
        addDataSource()
    }
    
    private func setupView() {
        
        view.addSubview(profileHeaderView)
        
        view.addSubview(tableView)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: idPhotosTableViewCell)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: idPostTableViewCell)
    }
    
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func addDataSource() {
        dataSource.append(.init(author: "Comics", description: "На прогулочке с друзьями", image: "first", id: "001", likes: 15, views: 30))
        dataSource.append(.init(author: "Comics", description: "Сложные отношения...", image: "second", id: "002", likes: 10, views: 22))
        dataSource.append(.init(author: "Comics", description: "Говорит подвезет", image: "third", id: "003", likes: 32, views: 57))
        dataSource.append(.init(author: "Comics", description: "Всем пис", image: "fourth", id: "004", likes: 29, views: 40))
    }
    
    func tapLikeLabel() {
        liked.toggle()
        self.tableView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: idPhotosTableViewCell, for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: idPostTableViewCell, for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.likeDelegate = self
            
            if liked {
                dataSource[indexPath.row - 1].likes += 1
                liked.toggle()
            }
            
            let article = dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        image: article.image,
                                                        description: article.description,
                                                        likes: article.likes,
                                                        views: article.views)
            cell.setup(viewModel: viewModel)
            return cell
        }
    }
}

//MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as! ProfileHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  220
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let viewController = DetailedPostViewController()
            viewController.selectedDataImage = dataSource[indexPath.row - 1].image
            viewController.selectedDataLikes = dataSource[indexPath.row - 1].likes
            viewController.selectedDataViews = dataSource[indexPath.row - 1].views + 1
            viewController.selectedDataAuthor = dataSource[indexPath.row - 1].author
            viewController.selectedDataDescription = dataSource[indexPath.row - 1].description
            viewController.selectedId = dataSource[indexPath.row - 1].id
            dataSource[indexPath.row - 1].views += 1
            self.tableView.reloadRows(at: [indexPath], with: .none)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - SetConstraints

extension ProfileViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

