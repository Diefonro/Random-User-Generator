//
//  APIRequest.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 19/08/2022.
//

import Foundation
import Alamofire

class APIRequest {
    
    let shared = APIRequest()
    
    var url = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo"
    var urlFemale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=female"
    var urlMale = "https://randomuser.me/api/?results=20&inc=gender,name,email,picture,phone,location,id,dob&noinfo&gender=male"
    
    func retrieveUsers(){
        
//        AF.request(url, method: .get).responseDecodable (of: ) 
        
    }
}
