//
//  AddOrderView.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 11/1/21.
//

import SwiftUI

struct AddOrderView: View {
    @StateObject var addOrderVM = AddOrderViewModel()
    @Binding var dissmiss:Bool
    var body: some View {
        VStack{
            TextField("Person Name", text: $addOrderVM.name)
            Picker("Type of Coffee", selection: $addOrderVM.type) {
                Text("Cappuccino").tag("cap")
                Text("Regular").tag("reg")
                Text("Expresso").tag("exp")
            }.pickerStyle(SegmentedPickerStyle())
            
            Button(action: {
                self.addOrderVM.saveOrder()
                self.dissmiss = false
            }, label: {
                Text("Place Order")
            }).padding(8)
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(10)
        }.padding()
        .navigationBarTitle("Add Order")
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(dissmiss: .constant(false))
    }
}
