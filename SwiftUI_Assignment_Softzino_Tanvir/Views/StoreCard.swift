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
                .frame(width: 80, height: 60)
                
            
            VStack(alignment:.leading){
                Group{
                    Text(store.storeName + "-" + store.storeNo)
                        .padding(.bottom,2)
                    Text(store.cityName + ", " + store.countryName)
                        .padding(.bottom,2)
                    if store.geoCode == "N/A"{
                        Text(store.shoppingCenterName)
                            .padding(.bottom,2)
                    }else{
                        Text(store.geoCode + ", " + store.shoppingCenterName)
                            .padding(.bottom,2)
                    }
                    
                        
                }.foregroundColor(.black)
                .font(.system(size: 13))
                
            }.padding(.leading,5)
            .padding(.trailing,15)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }.padding(12)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray, radius: 2)
        .padding(.bottom,5)
    }
}

//struct StoreCard_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreCard()
//    }
//}
