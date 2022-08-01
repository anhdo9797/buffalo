//
//  ListNewsViewModel.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
//

import Foundation
import SwiftUI

class NewsViewModel: ObservableObject {
    let newServices = NewsServices()
    @Published var articles: [Article] = [];
    @Published var isLoading: Bool = false;

    init() {
        getNews()
    }
    func getNews(search: String = "all") {
        Task {
            self.isLoading = true;
            do {
                let newsResult = try await newServices.getNews(search: search)
                self.articles = newsResult.articles ?? [];
            } catch {
                print("Fetch error")
            }
            self.isLoading = false;
        }

    }

}
