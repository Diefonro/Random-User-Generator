//
//  DateDecoder.swift
//  Random User Generator
//
//  Created by Andrés Fonseca on 19/08/2022.
//

import Foundation

class DateDecoder: JSONDecoder {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        // "1982-08-31T03:24:58.144Z"
        dateFormatter.dateFormat = "yyyy-mm-dd'T'HH:mm:ss.SSSX"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
