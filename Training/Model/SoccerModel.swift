//
//  SoccerModel.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let soccerModel = try? newJSONDecoder().decode(SoccerModel.self, from: jsonData)

import Foundation

// MARK: - SoccerModel
struct SoccerModel: Codable {
    let title, embed: String?
    let url: String?
    let thumbnail: String?
    let date: String?
    let competition: Competition?
    let videos: [Video]?
}

// MARK: - Competition
struct Competition: Codable {
    let name: String?
    let id: Int?
    let url: String?
}


// MARK: - Video
struct Video: Codable {
    let title, embed: String?
}
