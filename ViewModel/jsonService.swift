//
//  jsonService.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import Foundation

class jsonService
{
    private let sourceURL = "https://jsonplaceholder.typicode.com/todos";
    
    func downloadAndParse(coreData: coreDataService, ob: todoDataObservable, callback: @escaping ([todoModel]) -> Void)
    {
        if let todoData = coreData.retrieveTodoData(theObservable: ob)
        {
            print("data already stored")
            //print(todoData)
            callback(todoData)
        }
        
        else if let url = URL(string: sourceURL)
        {
            print("need to download data")
            URLSession.shared.dataTask(with: url)
            {
                data, response, error in
                
                if let data
                {
                    do
                    {
                        let decoder = JSONDecoder()
                        let todoData = try decoder.decode([todoModel].self, from: data)
                        callback(todoData)
                        coreData.saveTodoData(theObserverable: ob)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
