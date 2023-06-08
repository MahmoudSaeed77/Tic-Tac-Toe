//
//  SettingsView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 05/06/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("About Covid-19").padding(.leading)) {
                    
                    Label(
                        title: { Text("Covid-19 Dashboard") },
                        icon: { Image(systemName: "archivebox.fill")
                            .foregroundColor(.green)
                        }
                    )
                    
                    Label(
                        title: { Text("Protect against Covid-19") },
                        icon: { Image(systemName: "staroflife.fill")
                            .foregroundColor(.red)
                        }
                    )
                    
                }
                
                Section(header: Text("App").padding(.leading)) {
                    
                    Label(
                        title: {
                            HStack {
                                Text("App Version")
                                Spacer()
                                Text("1.0.1")
                                    .foregroundColor(.secondary)
                            }
                        },
                        icon: { Image(systemName: "exclamationmark.arrow.circlepath")
                            .foregroundColor(.green)
                        }
                    )
                    
                    Label(
                        title: {
                            Button(action: {}, label: {
                                Text("Terms of use and privacy policy")
                                    .accentColor(.blue)
                            })
                        },
                        icon: { Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.yellow)
                        }
                    )
                    
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Settings", displayMode: .large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
