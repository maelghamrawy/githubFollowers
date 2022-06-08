//
//  String+Ext.swift
//  githubFollowers
//
//  Created by Mahmoud on 05/06/2022.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        
        let dataformatter = DateFormatter()
        dataformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dataformatter.locale = Locale(identifier: "en_US_POSIX")
        dataformatter.timeZone = .current
        
        return dataformatter.date(from: self)
    }
    
    
    func displayFormat() -> String {
        guard let date = self.convertToDate() else {return "N/A"}
        return date.DateToString()
       
        }
    
    
}
