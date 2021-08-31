//
//  LocalFileServices.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 28/8/21.
//

import Foundation

class LocalFileServices{
    
    static var shared = LocalFileServices()
    
    private init(){}
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func parse(jsonData: Data) -> [ListModel] {
        do {
            let decodedData = try JSONDecoder().decode([ListModel].self,
                                                       from: jsonData)
            
            return decodedData
        } catch {
            print("Error",error)
        }
        return []
    }
    
}
