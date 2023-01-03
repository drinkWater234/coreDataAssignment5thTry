//
//  todoModel.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import Foundation

struct todoModel : Decodable, Equatable
{
    var userId : Int
    var id : Int
    var title : String
    var completed : Bool
}
