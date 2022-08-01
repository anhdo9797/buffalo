//
//  HomeView.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var isSplash: Bool = true;

    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "PrimaryColor")
        UITabBar.appearance().backgroundColor = UIColor(named: "Background100")
    }

    var body: some View {
        if isSplash {
            SplashView()
                .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isSplash = false
                }
            }

        } else {

            NavigationView {
                TabView {
                    DashboardView()
                        .tabItem {
                        Label("Home", systemImage: "house")

                    }
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                    NewsView()
                        .tabItem {
                        Label("News", systemImage: "newspaper")
                    }
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)

                    VideoView()
                        .tabItem {
                        Label("Videos", systemImage: "music.note.tv.fill")
                    }
                        .navigationBarHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                }
                    .accentColor(Color.theme.primary)

            }

        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
