//
//  SoccerService.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import Foundation

class VideoServices {
    let session = URLSession.shared;

    func getFootballs()async throws -> [SoccerModel] {

        guard let url = URL(string: "https://free-football-soccer-videos.p.rapidapi.com/") else {
            print("URL Invalid")

            return []
        }

        var request = URLRequest(url: url)
        let headers = [
            "X-RapidAPI-Key": "b0e0ad5972mshe94f45b72a54c9ep1e0373jsn093bd73bdc13",
            "X-RapidAPI-Host": "free-football-soccer-videos.p.rapidapi.com"
        ]

        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"

        let (data, _) = try await session.data(for: request)
        let decoder = JSONDecoder()


        return try! decoder.decode([SoccerModel].self, from: data)
    }

    func getPopularVideo(size: Int = 20)async throws -> [VideoModel] {

        guard let url = URL(string: "https://api.pexels.com/videos/popular?per_page=\(size)") else {
            print("URL Invalid")

            return []
        }

        var request = URLRequest(url: url)
        let headers = [
            "Authorization": "Bearer 563492ad6f91700001000001721fd1c3058b4a33828e2e8e3414010d",
        ]

        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"

        let (data, _) = try await session.data(for: request)
        let decoder = try! JSONDecoder().decode(PopularVideo.self, from: data)

        return decoder.videos ?? [];
    }
}
