//
//  ViewController.swift
//  FriendsList
//
//  Created by Nuri Chun on 1/27/19.
//  Copyright © 2019 tetra. All rights reserved.
//

import UIKit

class FriendsListController: UITableViewController {
    
    let cellId = "cellId"
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    private func setupUI() {
        setupTableViewAndCell()
        setupNavBarTitle()
        setupBarButtonItem()
    }
    
    private func setupData() {
        self.friends = CoreDataManager.shared.fetchFriends()
        tableView.reloadData()
    }
    
    private func setupTableViewAndCell() {
        tableView?.register(FriendsListCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func setupNavBarTitle() {
        navigationItem.title = "Friends"
    }
    
    private func setupBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handleAddFriend))
    }
    
    @objc private func handleAddFriend() {
        print("Add button tapped...")
        
        let createFriendController = CreateFriendController()
        createFriendController.delegate = self
        
        let navController = UINavigationController(rootViewController: createFriendController)
        present(navController, animated: true, completion: nil)
    }
}

extension FriendsListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return friends.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let friend = friends[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FriendsListCell
        cell.nameLabel.text = friend.name
        return cell
      }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("deleted row: \(indexPath.row)")
            
            let friend = friends[indexPath.row]

            self.friends.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            CoreDataManager.shared.deleteFriend(friend: friend)
            tableView.reloadData()
        }
    }
}

extension FriendsListController: CreateFriendControllerDelegate {
    func saveArray(ofFriends friends: [Friend]) {
        self.friends = friends
    }
}

