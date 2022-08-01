//
//  PopularVideoModel.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let popularVideo = try? newJSONDecoder().decode(PopularVideo.self, from: jsonData)

// MARK: - PopularVideo
struct PopularVideo: Codable {
    let page: Int?
    let videos: [VideoModel]?
    let totalResults: Int?
    let nextPage, url: String?


    enum CodingKeys: String, CodingKey {
        case page, videos
        case totalResults = "total_results"
        case nextPage = "next_page"
        case url

    }
}

// MARK: - Video
struct VideoModel: Codable {
    let id: Int?
    let url: String?
    let image: String?
    let videoFiles: [VideoFile]?

    enum CodingKeys: String, CodingKey {
        case url, image
        case videoFiles = "video_files"
        case id
    }
}

// MARK: - VideoFile
struct VideoFile: Codable {
    let id: Int?
    let quality, fileType: String?
    let width, height: Double?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case id, quality
        case fileType = "file_type"
        case width, height, link
    }
}
 
