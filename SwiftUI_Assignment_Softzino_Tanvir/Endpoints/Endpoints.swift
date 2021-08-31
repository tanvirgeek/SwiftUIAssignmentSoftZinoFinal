//
//  Endpoints.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 31/8/21.
//

import Foundation

enum EndPoint {
    case Base
}

class EndPointSouce {
    
    static func getEndPoint(type:EndPoint) -> String {
        switch type {
        case .Base:
            return "https://easyservice.xyz/assign/"
        }
    }
    
//    static var basicHeaders = ["Content-Type":"application/json", "Accept":"application/json"]
//
//    static func CustomHeaders() -> [String:String] {
//        //let token = CoreDataManager.shared.getUserLoken()?.token ?? ""
//        //let CustomHeaders = ["Authorization":"Bearer \(token)",
//                             //"Content-Type":"application/json",
//                             //"Accept":"application/json"]
//        let CustomHeaders = ["Content-Type":"application/json",
//                             "Accept":"application/json"]
//        return CustomHeaders
//    }
//
//    static func MultiPartCustomHeaders() -> [String:String] {
//        //let token = CoreDataManager.shared.getUserLoken()?.token ?? ""
//        let multiPartCustomHeaders = [//"Authorization":"Bearer \(token)",
//                                      "Content-Type":"multipart/form-data",
//                                      "Accept":"application/json"]
//        return multiPartCustomHeaders
//    }
    
}
