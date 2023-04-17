//
//  UIApplication.swift
//  MyCrypto
//
//  Created by kaiserdem  on 17.04.2023.
//

import SwiftUI
import Foundation

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
