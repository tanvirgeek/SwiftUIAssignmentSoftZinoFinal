//
//  StoresView.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import SwiftUI
import Kingfisher

struct StoresView: View {
    @StateObject private var storesVM = StoresViewModel()
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        //UINavigationBarAppearance().shadowColor = .red
    }
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9813820969, alpha: 1))
            if storesVM.stores.count == 0{
                ProgressView()
            }else{
                ScrollView{
                    LazyVStack{
                        ForEach(storesVM.stores){ store in
                            
                            NavigationLink(destination: StoreDetailView(store: store)) {
                                StoreCard(store: store)
                            }
                        }
                    }.padding(7)
                    
                    
                }.navigationBarTitle("Apple Stores", displayMode: .inline)
            }
        }
    }
}

struct StoresView_Previews: PreviewProvider {
    static var previews: some View {
        StoresView()
    }
}
