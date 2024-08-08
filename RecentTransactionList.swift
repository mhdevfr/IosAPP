//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Milan Herbé on 8/8/2024.
//

import Foundation
import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View{
        VStack{
            HStack{
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    TransactionList()
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.Text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index,
                transaction in TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.Background)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y:5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group{
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
            .environmentObject(transactionListVM)
    }
}
