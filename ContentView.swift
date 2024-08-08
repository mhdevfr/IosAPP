//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Milan Herbé on 7/8/2024.
//
import SwiftUICharts
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24){
                    //MARK TITLE
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    let data: [Double] = transactionListVM.accumulateTransactions()
                    let totalExpenses = data.last?.1 ?? 0
                    
                    CardView{
                        VStack{
                            ChartLabel()
                            
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                        foregroundColor: ColorGradient(Color.Icon.opacity(0.4), Color.Icon)))
                    .frame(height: 300)
                    .background(Color.systemBackground)
                    
                    
                    
                    //Recent buy
                    RecentTransactionList()
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //MARK Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View{
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
