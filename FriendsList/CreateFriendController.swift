//
//  CreateFriendController.swift
//  FriendsList
//
//  Created by Nuri Chun on 1/27/19.
//  Copyright © 2019 tetra. All rights reserved.
//

import Foundation
import UIKit

protocol CreateFriendControllerDelegate
{
    func saveArray(ofFriends friends: [Friend])
}

class CreateFriendController: UIViewController {
    
    var delegate: CreateFriendControllerDelegate?
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .lightGray
        tf.textAlignment = .center
        tf.placeholder = "Enter Your Friends Name"
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBarAppearance()
        setupNavBarItem()
        setupUI()
    }
    
    private func setupNavBarAppearance() {
        UINavigationBar.appearance().prefersLargeTitles = false
    }
    
    private func setupNavBarItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(handleSave))
    }
    
    @objc func handleBack() {
        print("back button tapped...")
        UINavigationBar.appearance().prefersLargeTitles = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSave() {
        print("save button tapped...")
        
        guard let name = nameTextField.text else { return }
        if name == "" { return } 
        
        CoreDataManager.shared.createFriend(name: name)
        let friends = CoreDataManager.shared.fetchFriends()
    
        delegate?.saveArray(ofFriends: friends)
        
        UINavigationBar.appearance().prefersLargeTitles = true
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        view.addSubview(nameTextField)
        nameTextField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topPad: 100, leftPad: 20, bottomPad: 0, rightPad: 20, width: 0, height: 50)
    }
}
