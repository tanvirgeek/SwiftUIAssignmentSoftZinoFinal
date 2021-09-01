//
//  StoresViewModel.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import Foundation
import SwiftUI

class StoresViewModel:ObservableObject{
    
    @Published var stores = [StoreViewModel]()
    @Published var isLoading = true
    
    init(){
        //self.getStoresFromLocalFile()
        self.getStoresFromAPI()
    }
    
    private func getStoresFromAPI() {
        StoresWebServices.shared.getStores {[weak self] result in
            switch result{
            case .success(let result):
                DispatchQueue.main.async {
                    self?.stores = result.map(StoreViewModel.init)
                    self?.isLoading = false
                }
            case .failure(let error):
                switch error{
                case .nodataAvailable:
                    print("Error: No data Available: \(error.localizedDescription)")
                case .invalidURL:
                    print("Error: invalid url: \(error.localizedDescription)")
                case .canNotProcessData:
                    print("Error: Can Not Process Data: \(error.localizedDescription)")
                case .encodingError:
                    print("Error: Encoding Error: \(error.localizedDescription)")
                case .statusCodeIsNotOkay:
                    print("Error: StatusCodeIsNot200 \(error)")
                }
            }
        }
    }
    
    func getStoresFromLocalFile(){
        let data = LocalFileServices.shared.readLocalFile(forName: "list")
        if let data = data{
            let storesFromJson = LocalFileServices.shared.parse(jsonData: data)
            self.stores = storesFromJson.map(StoreViewModel.init)
        }
        
    }
}

//This is a viewmodel for a single store. We can modify the incomming data here
class StoreViewModel:Identifiable{
    var id = UUID()
    var store:ListModel
    init(store:ListModel){
        self.store = store
    }
    var storeNo:String {
        return store.storeName
    }
    var storeName:String{
        return store.storeName
    }
    var addressLine: String{
        return store.addressDetails.addressLine
    }
    var cityName:String{
        return store.addressDetails.cityName
    }
    var countryName:String{
        return store.addressDetails.countryName
    }
    var zipcode:String{
        return store.addressDetails.zipCode ?? "No Zip Code"
    }
    var openHours:[OpenHour]{
        return store.openHours
    }
    var addressDetail: AddressDetails{
        return store.addressDetails
    }
    var flagShipName:String{
        return store.flagshipName ?? "No Flagship Name"
    }
    var regionName:String{
        return store.regionName ?? "No region Name"
    }
    var geoCode:String{
        if let geoCodeInt = store.geoCodee{
            return String(geoCodeInt)
        }else{
            return "N/A"
        }
    }
    var shoppingCenterName:String{
        return store.shoppingCenterName
    }
    var storeImageURL:String{
        return store.storePhotoURL
    }
}
