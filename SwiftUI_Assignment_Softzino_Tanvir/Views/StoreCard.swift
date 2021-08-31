//
//  StoreCard.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import SwiftUI
import Kingfisher

struct StoreCard: View {
    var store:StoreViewModel
    var body: some View {
        HStack{
            KFImage(URL(string: store.storeImageURL))
                .resizable()
                .frame(width: 128, height: 128)
                
                    
            VStack(alignment:.leading){
                Text(store.storeName + "-" + store.storeNo)
                Text(store.cityName + "," + store.countryName)
                Text("\(String(describing: store.geoCode))" + "," + store.shoppingCenterName)
            }
        }
    }
}

//struct StoreCard_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreCard()
//    }
//}
