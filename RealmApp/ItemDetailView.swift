//
//  ItemDetailView.swift
//  RealmApp
//
//  Created by Thor on 16/03/2022.
//

import SwiftUI
import RealmSwift

struct ItemDetailView: View {
    
    //    ObservedObject
    @ObservedRealmObject var item: Item
    
    //    @Environment(\.realm) var realm
    //    @Environment(\.realmConfiguration) var conf
    //
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Enter a new name")
            TextField("New Name",  text: $item.name)
                .textFieldStyle(.roundedBorder)
                .navigationTitle(item.name)
                .navigationBarItems(trailing: Toggle(isOn: $item.isFavorite){
                    Image(systemName: item.isFavorite ? "heart.fill":"heart")
                })
            
            Button {
                
                //                var conf = Realm.Configuration.defaultConfiguration
                //                conf.inMemoryIdentifier = "test"
                //                let realm = try! Realm(configuration: conf)
                
                if let newItem = item.thaw(),
                   let realm = newItem.realm{
                    
                    
                    try? realm.write{
                        realm.delete(newItem)
                    }
                }
                
            } label: {
                Text("Delete")
            }
            
            
        }.padding()
        
    }
}


struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetailView(item: Item())
        }
    }
}
