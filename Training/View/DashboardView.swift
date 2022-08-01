//
//  DashboardView.swift
//  Training
//
//  Created by phuocanh on 21/07/2022.
//

import SwiftUI
struct DashboardView: View {
    @StateObject private var vm = DashboardViewModel();
    @State private var search: String = "";

    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 0) {
                headerDashboard
                HStack(spacing: 0) {
                    ForEach(vm.tabs, id: \.self) { tab in
                        VStack {
                            Text(tab)
                                .padding(12)
//                                .frame(maxWidth: .infinity)
                            .cornerRadius(8)
                                .foregroundColor(vm.fil == tab ? Color.theme.primary : Color.theme.textSecondary)
                                .onTapGesture {
                                vm.onTapBottomAppbar(item: tab)
                            }
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(vm.fil == tab ? Color.theme.primary : Color.theme.background)
                        }
                            .padding(.top, 4)

                    }
                }

                    .background(Color.theme.background100)
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 0) {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.theme.background)

                            ForEach(vm.coins, id: \.id) { coin in
                                VStack {
                                    HStack(alignment: .center) {
                                        AsyncImage(url: URL(string: coin.image!)) { image in
                                            image.resizable().aspectRatio(contentMode: .fit)
                                                .clipShape(Circle())
                                        } placeholder: {
                                            ProgressView()
                                        }
                                            .frame(width: 50, height: 50)
                                        VStack(alignment: .leading) {
                                            Text(coin.name ?? "")
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.theme.textPrimary)
                                            Text("$\(String(coin.currentPrice!))")
                                                .font(.callout)
                                                .foregroundColor(Color.theme.textSecondary)

                                        }
                                        Spacer()
                                        HStack(alignment: .center, spacing: 0) {
                                            Text(String(coin.priceChange24H ?? 0))
                                                .foregroundColor(Color.white.opacity(0.9))
                                                .padding(4)
                                                .lineLimit(1)

                                        }.frame(width: 70, alignment: .trailing)
                                            .background(coin.marketCapChange24H! > 0 ? Color.theme.success : Color.theme.error)
                                            .cornerRadius(4)


                                    }
                                        .padding(.all)
                                        .foregroundColor(Color.white)
                                        .background(Color.theme.background200)
                                        .border(Color.theme.background.opacity(0.5), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

                                }

                            }
                        }
                    }
                }
            }
            if vm.isLoading {
                loadingView
            }
        }.onAppear {
            vm.getCoins()
        }
    }

}


extension DashboardView {
    var headerDashboard: some View {
        VStack {
            HStack {
                Button(action: { vm.onTapProfile() }) {
                    IICon(name: "person.circle", size: 24.0)
                }
                HStack {
                    TextField("search", text: $search)
                    Button(action: { vm.onTapProfile() }) {
                        IICon(name: "magnifyingglass", size: 20.0)
                    }
                }
                    .padding(8)
                    .background(Color.theme.background200)
                    .cornerRadius(12)

                Button(action: { vm.onTapProfile() }) {
                    IICon(name: "bell.fill", size: 24.0)
                        .padding()
                }

                Button(action: { vm.onTapProfile() }) {
                    IICon(name: "questionmark.circle.fill", size: 24.0)
                }
            } .padding(.horizontal)
                .background(Color.theme.background100)
                .foregroundColor(Color.theme.textSecondary)
        }

    }

    var coinsView: some View {
        VStack { Text("") }
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}
