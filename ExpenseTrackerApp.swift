//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Milan Herbé on 7/8/2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
