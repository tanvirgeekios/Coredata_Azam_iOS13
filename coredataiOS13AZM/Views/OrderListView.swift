//
//  OrderListView.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 12/1/21.
//

import SwiftUI

struct OrderListView: View {
    @StateObject var orderListVM = OrderListViewModel()
    @State private var showAddOrderSheet = false
    
    private func delete(at offsets:IndexSet){
        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(orderVM)
        }
    }
    
    var body: some View {
        List{
            ForEach(self.orderListVM.orders){ order in
                HStack{
                    Text(order.type)
                        .padding()
                    Text(order.name)
                        .padding()
                }
            }.onDelete(perform: delete)
        }.navigationBarTitle("Orders")
        .navigationBarItems(trailing: Button("Add New Order"){
            self.showAddOrderSheet = true
        }).sheet(isPresented: $showAddOrderSheet, onDismiss: {
            print("Dissmiss fired")
            self.orderListVM.fetchAllOrders()
        }) {
            AddOrderView( dissmiss: $showAddOrderSheet)        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
