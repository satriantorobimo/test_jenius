//
//  ContactAPI.swift
//  my_test
//
//  Created by Bimo Satriantoro on 18/06/20.
//  Copyright © 2020 Bimo Satriantoro. All rights reserved.
//

import Foundation

enum ContactError:Error{
    case noDataAvailable
    case canNotProcessData
}

struct ContactApi {
    var resourceURL:URL
    let urlAdd = "https://simple-contact-crud.herokuapp.com"
    
    init(codeReq: String, nameEndPoin: String){
        var resourceString: String
       
        resourceString = "\(urlAdd)/\(codeReq)"
        
        guard let resourceUrl = URL(string: resourceString) else{fatalError()}
        self.resourceURL = resourceUrl
    }
    
    func getDataContact(completion: @escaping(Result<[ContactDetail],ContactError>) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL){
            data, _, _ in guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let contactResponse = try decoder.decode(DataContact.self, from: jsonData)
                print(contactResponse)
                let contactDetail = contactResponse.data
                completion(.success(contactDetail))
            }catch{
                print(error)
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
}

