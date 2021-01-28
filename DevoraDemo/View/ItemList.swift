//
//  ItemList.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import SwiftUI

struct ItemList: View {
    @ObservedObject var devoraViewModel = DevoraViewModel()
    
    var body: some View {
        NavigationView {
            List(devoraViewModel.items) { item in
                NavigationLink(destination:  ItemDetail(items: devoraViewModel.items, index: item.id)) {
                    ItemRow(item: item)
                }
            }
            .navigationTitle("Devora item list")
        }
        .onAppear(){
            // print("Fetching")
            self.devoraViewModel.fetchAPI()
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
