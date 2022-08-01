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
//{
//          "title": "bitcoin: Moving beyond Bitcoin to the next crypto revolution in 2021",
//          "author": null,
//          "published_date": "2021-03-31 10:29:00",
//          "published_date_precision": "full",
//          "link": "https://economictimes.indiatimes.com/markets/stocks/news/moving-beyond-bitcoin-to-the-next-crypto-revolution-in-2021/articleshow/81773999.cms",
//          "clean_url": "indiatimes.com",
//          "summary": "ET Spotlight SpecialThe dramatic rise in Bitcoin value has put cryptocurrency on the map in the investment space. Since its inception - not over a decade ago, Bitcoin has surpassed great heights in terms of value. It is the biggest cryptocurrency\n with a $1 trillion economy. While Bitcoin is the largest cryptocurrency, there are over 5000+ cryptocurrencies currently in circulation, many of which are listed on the CoinSwitch\n Kuber app. However, most people are unaware of these currencies. Severa",
//          "rights": "indiatimes.com",
//          "rank": 325,
//          "topic": "economics",
//          "country": "IN",
//          "language": "en",
//          "authors": [],
//          "media": "https://img.etimg.com/thumb/msid-81773937,width-1070,height-580,imgsize-101309,overlay-etmarkets/photo.jpg",
//          "is_opinion": false,
//          "twitter_account": "@EconomicTimes",
//          "_score": 10.445324,
//          "_id": "d249a630bc9e1b76287940503041b1f4"
//      },
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
