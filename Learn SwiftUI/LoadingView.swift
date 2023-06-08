//
//  LoadingView.swift
//  Learn SwiftUI
//
//  Created by Mahmoud Saeed on 05/06/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading")
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
            .background(
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .fill(Color.white)
                    .frame(width: 130, height: 130)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0.0, y: 20)
            )
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
