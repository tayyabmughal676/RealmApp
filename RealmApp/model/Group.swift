//
//  Group.swift
//  RealmApp
//
//  Created by Thor on 16/03/2022.
//

import Foundation
import RealmSwift


final class Group: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var _id: ObjectId
     
    @Persisted var items = RealmSwift.List<Item>()
    
    
}
