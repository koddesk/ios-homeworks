//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 25.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let customView = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?.first as? ProfileView {
            view.addSubview(customView)
        }
    }
}
