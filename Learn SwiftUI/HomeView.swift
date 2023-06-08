//
//  HomeView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 04/06/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showLoading: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Items list").padding(.leading)) {
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        Text("Tis application is active")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .font(.title)
                        Divider()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                        Text("Yor phone is now active, please save the otp number and do not tell any one.")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Button(action: {}, label: {
                            Text("Disable")
                                .foregroundColor(.white)
                                .opacity(0.5)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.gray.opacity(0.35))
                                .cornerRadius(8)
                        }).buttonStyle(PlainButtonStyle())
                    }.padding(.vertical, 8)
                }.listRowBackground(Color(.black))
                Section(header: Text("Hello from the section").padding(.leading)) {
                    Text("No recent items")
                        .foregroundColor(.secondary)
                }
            }.listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Home", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                showLoading = !showLoading
            }, label: {
                Image(systemName: "network")
                    .foregroundColor(.green)
                    .font(.title3)
            }))
        }
        .overlay(
            showLoading ? LoadingView() : nil
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
