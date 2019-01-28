# FriendsList

A list where you are able to add friends and delete them as well. 

## Purpose

To present how Core Data can be utilized. Simple project compared to CompanyList. Also to refresh my memory before an interview.

## Demo

![friendslistadd delete](https://user-images.githubusercontent.com/36717095/51870593-103ffd00-2322-11e9-95ff-19694f106566.gif)

## Framework

import CoreData

## What Can I Do With Core Data? 

- Create an Entity, in this case Friend
- Add an attribute to Entity, in this case name.
- Set up Core Data Model separate from AppDelegate.
- Insert/Delete/Fetch NSManagedObjects 
- Know how to use NSPersistentContainer to create a viewContext. 

## Extra Features
- In CoreDataManager, I have used the singleton to access from any class at ease. Be cautious how to use it.
- Using UITableViewController, I have utilized couple functions from the delegate/datasource.
- Delete cell .automatic for that specific index utilizing the canEditRowAt & editingStyle. 
- Programmtically coded the UI. 

## Requirements
<pre>
IDE: Xcode (NEEDED TO OPEN)
Language&Version: Swift 4.2 
Developing software for mainly, macOS, iOS, watchOS, and tvOS.
</pre>

## Git Clone

<pre>
$ git clone https://github.com/tetraprism95/CompanyList.git 
</pre>
