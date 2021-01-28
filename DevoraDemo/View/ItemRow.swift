//
//  ItemRow.swift
//  DevoraDemo
//
//  Created by Géza MacBook Pro on 2021. 01. 28..
//

import SwiftUI

struct ItemRow: View {    
    var item: Items
    
    var body: some View {
        HStack {
            ImageViewWidget(imageUrl: item.thumbnailURL)
                .frame(width: 30, height: 30)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 0.6))
                .shadow(radius: 5)
            
            Text(item.title)
                .font(.title3)
                .padding(.leading, 10)
            
            Spacer()
        }
    }
}

//
//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow()
//    }
//}
