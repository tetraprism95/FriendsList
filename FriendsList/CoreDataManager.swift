//
//  CoreDataManager .swift
//  FriendsList
//
//  Created by Nuri Chun on 1/27/19.
//  Copyright © 2019 tetra. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    let entityFriend = "Friend"
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "FriendsList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func createFriend(name: String) {
        
        let context = persistentContainer.viewContext

        let friend = Friend(context: context)
        friend.name = name
        
        do {
            try context.save()
            print("Friend has been created.")
        } catch let err {
            print("Failed to create friend: ", err)
        }
    }
    
    func deleteFriend(friend: Friend) {
        
        let context = persistentContainer.viewContext
        context.delete(friend)
        
        do {
            try context.save()
        } catch let saveErr {
            print("Save Error: ", saveErr)
        }
    }
    
    func fetchFriends() -> [Friend] {
        
        let context = persistentContainer.viewContext
        
        do {
            let friends = try context.fetch(Friend.fetchRequest()) as [Friend]
            friends.forEach({print("\($0.name ?? "")")})
            return friends
        } catch let fetchErr {
            print("Failed to fetch companies ", fetchErr)
            return []
        }
    }
}
