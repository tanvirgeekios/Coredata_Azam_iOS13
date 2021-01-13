//
//  OrderListViewModel.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 12/1/21.
//

import Foundation
import SwiftUI
import CoreData

class OrderListViewModel:ObservableObject{
    
    @Published var orders = [OrderViewModel]()
    
    init(){
        fetchAllOrders()
    }
    
    func fetchAllOrders(){
        let orders = CoreDataManager.shared.getAllOrders()
//        orders.forEach { (order) in
//            self.orders.append(OrderViewModel(order: order))
//        }
        self.orders = orders.map(OrderViewModel.init)
        print(self.orders)
    }
    
    func deleteOrder(_ orderVM:OrderViewModel){
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
    
}

class OrderViewModel:Identifiable {
    private var order:Order
    
    init(order:Order){
        self.order = order
    }
    var name:String {
        return self.order.name ?? "Unknown Name"
    }
    var type : String {
        return self.order.type ?? "Unknow type"
    }
}
