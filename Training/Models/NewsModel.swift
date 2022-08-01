//
//  NewsModel.swift
//  Training
//
//  Created by phuocanh on 22/07/2022.
import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let status: String?
    let totalHits, page, totalPages, pageSize: Int?
    let articles: [Article]?
    let userInput: UserInput?

    enum CodingKeys: String, CodingKey {
        case status
        case totalHits
        case page
        case totalPages
        case pageSize
        case articles
        case userInput
    }
}

// MARK: - Article
struct Article: Codable {
    let title, author, publishedDate, publishedDatePrecision: String?
    let link: String?
    let cleanURL, summary, rights: String?
    let rank: Int?
    let topic, country, language, authors: String?
    let media: String?
    let isOpinion: Bool?
    let twitterAccount: String?
    let score: Double?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case title, author
        case publishedDate = "published_date"
        case publishedDatePrecision = "published_date_precision"
        case link
        case cleanURL = "clean_url"
        case summary, rights, rank, topic, country, language, authors, media
        case isOpinion
        case twitterAccount = "twitter_account"
        case score = "_score"
        case id = "_id"
    }
}
 
// MARK: - UserInput
struct UserInput: Codable {
    let q, lang, from, sortBy: String?
    let page, size: Int?

    enum CodingKeys: String, CodingKey {
        case q, lang, from
        case sortBy
        case page, size
    }
}
