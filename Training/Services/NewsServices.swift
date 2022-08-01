//
//  NewsServices.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
//

import Foundation

class NewsServices {
    var session = URLSession.shared

    func getNews(search: String = "new")async throws -> NewsModel {

        let url = "https://free-news.p.rapidapi.com/v1/search?q=\(search)&lang=en"
        let headers = [
            "X-RapidAPI-Key": "b0e0ad5972mshe94f45b72a54c9ep1e0373jsn093bd73bdc13",
            "X-RapidAPI-Host": "free-news.p.rapidapi.com"
        ]

        var request = URLRequest(url: URL(string: url)!);
        request.allHTTPHeaderFields = headers;
        request.httpMethod = "GET"

        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()

        return try decoder.decode(NewsModel.self, from: data)
    }
}
