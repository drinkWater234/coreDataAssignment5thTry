//
//  coreDataService.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import Foundation
import CoreData
import UIKit

class coreDataService
{
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "CoreDataJSON", in: coreDataService.context)
    
    // This function takes the data from stored in todoDataObservable and saves it with core data
    func saveTodoData(theObserverable: todoDataObservable)
    {
        for a in theObserverable.myJSONData
        {
            let newUser = NSManagedObject(entity: entity!, insertInto: coreDataService.context)
            newUser.setValue(a.id, forKey: "id")
            newUser.setValue(a.userId, forKey: "userId")
            newUser.setValue(a.title, forKey: "title")
            newUser.setValue(a.completed, forKey: "completed")
            
            do
            {
                try coreDataService.context.save()
            } catch {
                print("Error saving")
            }
        }
    }
    
    // This function retrieves data stored in core data and returns it
    func retrieveTodoData(theObservable: todoDataObservable) -> [todoModel]?
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataJSON")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let result = try coreDataService.context.fetch(CoreDataJSON.fetchRequest())
            
            if (result as [NSManagedObject]).count == 0
            {
                return nil
            }
            
            var x = [todoModel]()
            
            for data in result as [NSManagedObject]
            {
                x.append(todoModel(userId: data.value(forKey: "userId") as! Int,
                                   id: data.value(forKey: "id") as! Int,
                                   title: data.value(forKey: "title") as! String,
                                   completed: data.value(forKey: "completed") as! Bool)
                )
                
                /*
                print(data.value(forKey: "id") as! Int)
                print(data.value(forKey: "userId") as! Int)
                print(data.value(forKey: "title") as! String)
                print(data.value(forKey: "completed") as! Bool)
                 */
            }
            //print(x)
            return x
        } catch {
            print(error)
        }
        return nil
    }
}
