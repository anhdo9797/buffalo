//
//  SoccerViewModel.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import Foundation

class SoccerViewModel: ObservableObject {
    let services = VideoServices();

    @Published var isLoading: Bool = true
    @Published var soccers: [SoccerModel] = []
    @Published var videos: [VideoModel] = []
    @Published var isStart: String = ""

    init() {
        getVideos()

    }

    func getSoccers() {

        Task {
            self.isLoading = true
            self.soccers = try await services.getFootballs()
            self.isLoading = false
        }
    }


    func getVideos() {

        Task {
            self.isLoading = true
            self.videos = try await services.getPopularVideo()
            self.isLoading = false
        }
    }



    func dataLoad<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }

    func updateID(id: String) {
        self.isStart = id
    }
}
