//
//  CoreDataJSON+CoreDataProperties.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//
//

import Foundation
import CoreData


extension CoreDataJSON {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataJSON> {
        return NSFetchRequest<CoreDataJSON>(entityName: "CoreDataJSON")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var userId: Int64
    @NSManaged public var completed: Bool

}

extension CoreDataJSON : Identifiable {

}
