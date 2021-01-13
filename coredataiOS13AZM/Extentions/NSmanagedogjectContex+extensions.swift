//
//  NSmanagedogjectContex+extensions.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 11/1/21.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext{
    static var current:NSManagedObjectContext{
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
}
