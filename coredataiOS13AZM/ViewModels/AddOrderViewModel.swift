//
//  AddOrderViewModel.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 11/1/21.
//

import Foundation

class AddOrderViewModel:ObservableObject{
    @Published var name:String = ""
    @Published var type:String = ""
    
    func saveOrder(){
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
}
