//
//  HealthDairy.swift
//  DiaSmoke
//
//  Created by apple on 29/01/20.
//  Copyright © 2020 Confidosoft. All rights reserved.
//

import UIKit
import Foundation
import CoreData

@objc(UserInfo)
class UserInfo: SBCoreDataManagedObject {
    override public class var elementToPropertyMapping: [String: String] {
        // [serverKey: DBKey]
        return ["id": "id","name": "name","image": "image"]
    }
    
    override public class var primaryKeyProperty: String {
        return "id"
    }

    override public class var primaryKeyElement: String {
        return "id"
    }
    
    override public class var defaultSortKey: String {
        return "id"
    }
    
    override public class var useAscendingSort: Bool {
        return true
    }
    
    override public func insertRelatedEntities(mappedTo element: JSON, into context: NSManagedObjectContext) {
        // no operation required here
    }
}
