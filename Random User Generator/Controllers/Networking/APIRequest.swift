//
//  APIRequest.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 19/08/2022.
//

import Foundation
import Alamofire

class APIRequest {
    
    static let shared = APIRequest()
    
    var urlAfterFilter = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo"
    
    var url = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo"

    var urlFemale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=female"
    var urlMale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=male"
    
    func retrieveUsers(completion: @escaping (_ users:[User]?,_ error:Error?) -> Void){
        
        AF.request(url, method: .get).responseDecodable (of: Results.self, decoder: DateDecoder()){ response in
            if let person = response.value?.results{
                completion(person, nil)
            } else {
                print(response.error?.responseCode ?? "Unknown error")
                completion(nil, response.error)
            }
        }
        
    }
}
