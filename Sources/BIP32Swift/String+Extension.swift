//
//  File.swift
//  
//
//  Created by math on 2021/9/26.
//

import Foundation
extension String {
    
    func hasHexPrefix() -> Bool {
        return self.hasPrefix("0x")
    }
    
    func stripHexPrefix() -> String {
        if self.hasPrefix("0x") {
            let indexStart = self.index(self.startIndex, offsetBy: 2)
            return String(self[indexStart...])
        }
        return self
    }
    
    func addHexPrefix() -> String {
        if !self.hasPrefix("0x") {
            return "0x" + self
        }
        return self
    }
}
