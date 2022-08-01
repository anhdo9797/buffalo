//
//  SplashView.swift
//  Training
//
//  Created by phuocanh on 25/07/2022.
//

import SwiftUI

struct SplashView: View {
    var body: some View {

        VStack {
            GIFView(type: .name("splash"))
                .frame(width: UIScreen.main.bounds.width - 20, height: (UIScreen.main.bounds.width * 4 - 20) / 4.5)
                .padding()

        }.frame(height: UIScreen.main.bounds.height).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.219, green: 0.282, blue: 0.314)/*@END_MENU_TOKEN@*/)
            
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .preferredColorScheme(.dark)
    }
}
