//
//  PersistanceManager.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/3/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import Foundation
import MagicalRecord

typealias Persistanble = NSManagedObject

protocol PersistanceManager {
    func fetchAllRecords<Entity: Persistanble>() -> [Entity]
    func fetchRecord<Entity: Persistanble>(with id: String) -> Entity
    func saveRecord<Entity: Persistanble>(saveCode: @escaping (Entity) -> Void)
}


class PersistanceManagerImpl: PersistanceManager {
    
    
    func fetchRecord<Entity>(with id: String) -> Entity where Entity : Persistanble {
        if let resultObject = Entity.mr_findFirst(byAttribute: "id", withValue: id) {
            return resultObject
        } else {
            return Entity()
        }
    }
    
    func fetchAllRecords<Entity>() -> [Entity] where Entity : Persistanble {
        if let resultArray = Entity.mr_findAll() as? [Entity] {
            return resultArray
        } else {
            return []
        }
    }
    
    
    func saveRecord<Entity>(saveCode: @escaping (Entity) -> Void) where Entity : Persistanble {
        MagicalRecord.save({ (localContext) in
            let localEntity: Entity = Entity.mr_createEntity(in: localContext)!
            saveCode(localEntity)
        })

    }
    
}



class PersistanceManagerFactory {
    public static func createPersistanceManager() -> PersistanceManager {
        MagicalRecord.setupCoreDataStack(withStoreNamed: "CoreData")
        
        return PersistanceManagerImpl()
    }
    
}