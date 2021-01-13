//
//  CoreDataManager.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 11/1/21.
//

import Foundation
import CoreData

class CoreDataManager{
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    var moc:NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext){
        self.moc = moc
    }
    
    func saveOrder(name:String, type:String){
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do{
            try self.moc.save()
        }catch{
            print(error)
        }
    }
    
    private func fetchOrder(name:String) -> Order?{
        var orders = [Order]()
        let request:NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do{
            orders = try self.moc.fetch(request)
        }catch{
            print(error)
        }
        return orders.first
    }
    
    func deleteOrder(name:String){
        do{
            if let order = fetchOrder(name: name){
                self.moc.delete(order)
                try self.moc.save()
            }
        }catch{
           print(error)
        }
    }
    
    func getAllOrders() -> [Order]{
        var orders = [Order]()
        let orderRequest:NSFetchRequest<Order> = Order.fetchRequest()
        
        do{
            orders = try self.moc.fetch(orderRequest)
        }catch{
            print(error)
        }
        
        return orders
    }
}
