//
//  Date+EXT.swift
//  githubFollowers
//
//  Created by Mahmoud on 05/06/2022.
//

import Foundation

extension Date {
    
    func DateToString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM YYYY"
        
        return dateFormatter.string(from: self)
        
    }
     
}
