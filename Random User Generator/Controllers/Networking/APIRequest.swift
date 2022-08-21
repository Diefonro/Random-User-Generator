//
//  APIRequest.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 19/08/2022.
//

import Foundation
import Alamofire
import UIKit

class APIRequest {
    
    static let shared = APIRequest()
    
    var apiError = false
    
    var urlAfterFilter = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo"
    
    var url = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo"

    var urlFemale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=female"
    var urlMale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=male"
    
    func retrieveUsers(success: @escaping (_ user:[User]?) -> Void, failure: @escaping (_ error:Error?) -> Void){
        
        AF.request(url, method: .get).responseDecodable (of: Results.self, decoder: DateDecoder()){ response in
            if let person = response.value?.results{
                success(person)
            } else {
                failure(response.error)
                self.apiError = true
                print(response.error?.responseCode ?? "API not working. Please refresh using refresh button.")
            }
        }
        
    }
}
