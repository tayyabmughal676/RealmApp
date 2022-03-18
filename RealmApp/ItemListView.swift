//
//  ItemListView.swift
//  RealmApp
//
//  Created by Thor on 16/03/2022.
//

import SwiftUI
import RealmSwift

struct ItemListView: View {
    
    @ObservedRealmObject var group: Group
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(group.items){item in
                    ItemRow(item: item)
                }
                .onMove(perform: $group.items.move)
                .onDelete(perform: $group.items.remove)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Items", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems( trailing: EditButton())
            .toolbar {
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        $group.items.append(Item())
                    } label: {
                        Image(systemName: "plus")
                    }.frame(maxWidth: .infinity,
                            alignment: .trailing)
                }
                
                
            }
        }
    }
}

struct ItemRow: View {
    
    @ObservedRealmObject var item: Item
    
    var body: some View{
        NavigationLink(destination: ItemDetailView(item: item)) {
            Text(item.name)
            if item.isFavorite{
                Image(systemName: "heart.fill")
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(group: Group())
    }
}
