//
//  StoresWebService.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 31/8/21.
//

import Foundation

enum NetworkingError:Error{
    case nodataAvailable
    case invalidURL
    case canNotProcessData
    case encodingError
    case statusCodeIsNotOkay
}

class StoresWebServices{
    static let shared = StoresWebServices()
    
    private init(){}
    
    private let session = URLSession.shared
    
    //Get Method
    func getStores(completion: @escaping (Result<[ListModel],NetworkingError>)->Void){
        
        let urlStirng = EndPointSouce.getEndPoint(type: .Base)
        
        print(urlStirng)
        guard let url = URL(string: urlStirng) else {
            completion(.failure(.invalidURL))
            return
        }
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let jsonData = data else{
                completion(.failure(.nodataAvailable))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Response is nil")
                return
            }
            print(response.statusCode)
            //print(jsonData)
            if response.statusCode == 200{
                do{
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode([ListModel].self, from: jsonData)
                    completion(.success(responseObject))
                }catch{
                    print("Error \(error)")
                    completion(.failure(.canNotProcessData))
                }
            }else{
                completion(.failure(.statusCodeIsNotOkay))
            }
            
        }
        
        dataTask.resume()
    }
}
