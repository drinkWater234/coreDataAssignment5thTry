//
//  todoDataObservable.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import Foundation

class todoDataObservable
{
    var bindToController : (() -> ()) = {}
    var myJSONService : jsonService
    var myCoreDataService: coreDataService
    
    var myJSONData : [todoModel] = []
    {
        didSet
        {
            bindToController()
        }
    }
    
    init()
    {
        myCoreDataService = coreDataService()
        myJSONService = jsonService()
        getTodoData()
    }
    
    func getTodoData()
    {
        myJSONService.downloadAndParse(coreData: myCoreDataService,
                                       ob: self,
                                       callback: {self.myJSONData = $0})
    }
}
