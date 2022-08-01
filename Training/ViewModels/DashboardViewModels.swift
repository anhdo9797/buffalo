//
//  DashboardViewModels.swift
//  Training
//
//  Created by phuocanh on 21/07/2022.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var tabs: [String] = ["Popular", "Increase price", "Reduced price"];
    @Published var coins: [CoinModel] = [];
    @Published var fil: String = "Popular";
    @Published var isLoading: Bool = false;
    @Namespace var topID
    @Published var scrollview: ScrollViewProxy? = nil

    init() {
    }

    func getCoins() {
        print("init dataa")
        self.isLoading = true;

        let orderType = _getOrderType()
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=\(orderType)&per_page=50&page=1&sparkline=false&price_change_percentage=24h";

        Task {

            guard let url = URL(string: url) else {
                print("Invalid URL")
                return
            }
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }

                guard let response = response as? HTTPURLResponse else { return }

                if response.statusCode == 200 {
                    guard let data = data else { return }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        do {
                            let decodedUsers = try JSONDecoder().decode([CoinModel].self, from: data)
                            self.coins = decodedUsers

                            self.isLoading = false;


                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }
            dataTask.resume()
        }
    }

    func _getOrderType() -> String {
        switch fil {
        case "Popular":
            return "gecko_desc"
        case "Increase price":
            return "market_cap_desc"
        default:
            return "market_cap_desc"
        }
    }

    func onTapBottomAppbar(item: String) {
        withAnimation(.spring()) {
            self.fil = item;
            getCoins()
        }

    }

    func onTapProfile() { }
    func onTapSearch() { }
    func onTapHelp() { }
    func onTapNotification() { }
}
