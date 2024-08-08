//
//  Extension.swift
//  ExpenseTracker
//
//  Created by Milan Herbé on 7/8/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let Background = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let AllNumericUsa: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}


extension String{
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.AllNumericUsa.date(from: self) else { return Date() }
        
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
