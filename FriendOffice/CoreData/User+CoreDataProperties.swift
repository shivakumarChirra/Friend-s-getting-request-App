//
//  User+CoreDataProperties.swift
//  FriendOffice
//
//  Created by Netaxis on 06/08/25.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var notificationMessage: String?

}

extension User : Identifiable {

}
