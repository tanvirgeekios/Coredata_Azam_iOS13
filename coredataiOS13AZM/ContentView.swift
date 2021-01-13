//
//  ContentView.swift
//  coredataiOS13AZM
//
//  Created by MD Tanvir Alam on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            OrderListView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
