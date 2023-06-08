//
//  NotificationView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 04/06/2023.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        
        
        NavigationView {
            List {
                Section(header:
                            VStack(alignment: .leading) {
                                Text("Share your covid 19 positive diagnoses")
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                    .font(.body)
                                
                                Text("I'm sorry, but as an artificial intelligence language model, I don't have personal experiences or medical history. While I have been trained on a vast amount of information, I do not have the capability to contract or diagnose illnesses, including COVID-19. However, I can provide information about COVID-19 and answer any questions you may have to the best of my knowledge.")
                                    .fontWeight(.regular)
                                    .foregroundColor(.secondary)
                                    .font(.body)
                                    .padding(.top, 5)
                                
                                Text("Certainly! COVID-19, also known as coronavirus disease 2019, is a contagious respiratory illness caused by a virus called SARS-CoV-2. The virus was first identified in Wuhan, China in December 2019 and has since spread globally, leading to a worldwide pandemic. COVID-19 primarily spreads through respiratory droplets when an infected person talks, coughs, or sneezes. The symptoms of COVID-19 can range from mild to severe and include fever, cough, fatigue, body aches, loss of taste or smell, and difficulty breathing.")
                                    .fontWeight(.regular)
                                    .foregroundColor(.secondary)
                                    .font(.body)
                                    .padding(.top, 5)
                                    .padding(.leading)
                                
                            }.textCase(.none), footer: Text("sharing you diagnosis is your responsibility and based on your testimony.").padding(.leading)) {
                    
                    
                    Button(action: {}, label: {
                        Text("Share your positive diagnosis.")
                            .accentColor(.blue)
                    })
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Notify Others"), displayMode: .large)
        }
        
        
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
