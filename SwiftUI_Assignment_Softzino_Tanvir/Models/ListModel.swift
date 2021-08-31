//
//  ListModel.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import Foundation

// MARK: - List
struct ListModel: Codable {
    let storeNo, storeName: String
    let addressDetails: AddressDetails
    let openHours: [OpenHour]
    let flagshipName:String?
    let regionName: String?
    let geoCodee:Int?
    let storePhotoURL: String
    let shoppingCenterName: String
    
    enum CodingKeys: String, CodingKey {
        case storeNo = "store_no"
        case storeName = "store_name"
        case addressDetails = "address_details"
        case openHours = "open_hours"
        case flagshipName = "flagship_name"
        case regionName = "region_name"
        case storePhotoURL = "store_photo_url"
        case shoppingCenterName = "shopping_center_name"
        case geoCodee = "geoCode"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        storeName = try container.decode(String.self, forKey: .storeName)
        storeNo = try container.decode(String.self, forKey: .storeNo)
        regionName = try container.decodeIfPresent(String.self, forKey: .regionName)
        flagshipName = try container.decodeIfPresent(String.self, forKey: .flagshipName)
        storePhotoURL = try container.decode(String.self, forKey: .storePhotoURL)
        shoppingCenterName = try container.decode(String.self, forKey: .shoppingCenterName)
        addressDetails = try container.decode(AddressDetails.self, forKey: .addressDetails)
        geoCodee = try container.decodeIfPresent(Int.self, forKey: .geoCodee)
        
        var lopeningHours = [OpenHour]()
        let openingHoursDict = try container.decode([String: OpenHour].self, forKey: .openHours)
        for i in 1...openingHoursDict.count {
            lopeningHours.append(openingHoursDict["\(i)"]!)
        }
        
        self.openHours = lopeningHours
        
    }
}

// MARK: - AddressDetails
struct AddressDetails: Codable {
    let addressLine, cityName, countryName: String
    let zipCode: String?
    let stateName : String?
    
    enum CodingKeys: String, CodingKey {
        case addressLine = "address_line"
        case cityName = "city_name"
        case stateName = "state_name"
        case countryName = "country_name"
        case zipCode = "zip_code"
    }
}

// MARK: - OpenHour
struct OpenHour: Codable,Hashable {
    let startingTime, closingTime: String
    let notes:String?
    enum CodingKeys: String, CodingKey {
        case startingTime = "starting_time"
        case closingTime = "closing_time"
        case notes
    }
}
