//
//  ListNiewView.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var vm = NewsViewModel();
    @State private var search: String = ""

    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack(spacing: 0) {
                headerNewsView
                ScrollView {
                    VStack(spacing: 28) {
                        ForEach(vm.articles, id: \.id) { article in
                            NavigationLink(destination: NewsDetail(url: article.link ?? "")) {
                                NewsCard(article: article)
                            }
                        }
                    }
                        .padding()
                }
            }
            
            if vm.isLoading {
                ZStack {
                    loadingView
                }
            }
        }
    }

}


extension NewsView {
    var headerNewsView: some View {
        VStack {
            HStack {
                HStack {
                    TextField("Search", text: $search)
                        .foregroundColor(Color.theme.textPrimary)
                        .onSubmit {
                        print("submit")
                        vm.getNews(search: search)
                    }

                    if search.count == 0 {
                        Button(action: { }) {
                            IICon(name: "magnifyingglass", size: 20.0)
                        }
                    } else {
                        Button(action: { self.search = "" }) {
                            IICon(name: "x.circle", size: 24.0)
                                .foregroundColor(Color.theme.error)
                        }
                    }
                }
                    .padding(8)
                    .background(Color.theme.background200)
                    .cornerRadius(12)
                    .padding(.horizontal, 8)


                Button(action: { }) {
                    IICon(name: "plus", size: 24.0)

                }

            } .padding(.horizontal)
                .padding(.bottom)
                .background(Color.theme.background100)
                .foregroundColor(Color.theme.textSecondary)
        }

    }

    var coinsView: some View {
        VStack { Text("") }
    }
}




struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .preferredColorScheme(.dark)
    }
}
