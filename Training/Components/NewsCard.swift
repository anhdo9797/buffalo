//
//  NewsCard.swift
//  Training
//
//  Created by phuocanh on 25/07/2022.
//

import SwiftUI

struct NewsCard: View {
    let article: Article;
    var body: some View {

        VStack(alignment: .center) {
            AsyncImage(url: URL(string: article.media!)) { image in
                image
                    .resizable()
                    .cornerRadius(12, corners: [.topLeft, .topRight])
                    .frame(height: 200, alignment: .center)

            } placeholder: {

                ProgressView()
                    .frame(height: 200)


            }

            VStack(alignment: .leading, spacing: 8) {
                Text(article.title!)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.textPrimary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(article.summary!)
                    .font(.caption)
                    .foregroundColor(Color.theme.textSecondary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
             
                .padding(8)
            
            
            HStack {
                Image(systemName: "eye")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 16, height: 16, alignment: .center)
                    .foregroundColor(Color.theme.textSecondary)

                Text("\(article.score ?? 0, specifier: "%.2f")")
                    .font(.caption)
                    .foregroundColor(Color.theme.textSecondary)

                Image(systemName: "clock")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 12, height: 12, alignment: .center)
                    .foregroundColor(Color.theme.textSecondary)

                Text(article.publishedDate ?? "")
                    .font(.caption)
                    .foregroundColor(Color.theme.textSecondary)
                Spacer()
                Button(action: { }) {
                    Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fit)
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(Color.theme.textPrimary)
                        .padding(8)
                        .padding(.horizontal, 12)

                }

            }
                .padding(12)
                .background(Color.theme.textSecondary.opacity(0.2))
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
        }
            .background(RoundedRectangle(cornerRadius: 12).stroke(Color.theme.background200, lineWidth: 1))


    }

}


struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.theme.background
            ScrollView {
                VStack(spacing: 28) {
                    NewsCard(article: Article(title: "ByHT News Desk, New Delhi", author: "", publishedDate: "2022-07-23 02:10:18", publishedDatePrecision: "", link: "", cleanURL: "", summary: "Here are today's top ", rights: "", rank: 12, topic: "", country: "", language: "", authors: "", media: "https://images.hindustantimes.com/img/2022/07/25/1600x900/WhatsApp_Image_2021-09-18_at_09.42.18_1631944439782_1658709580179_1658709580179.jpeg", isOpinion: true, twitterAccount: "", score: 123, id: "1233"))

                    NewsCard(article: Article(title: "new2", author: "", publishedDate: "2022-07-25 02:10:18", publishedDatePrecision: "", link: "", cleanURL: "", summary: "Here are today's top news, analysis and opinion. Know all about the latest news and other news updates from Hindustan Times.Eight die, 20 hurt as double-decker buses collide on UP's Purvanchal ExpresswayAt least eight people died and 20 others were injured after a stationary double-decker bus on the roadside was hit by a speeding double-decker bus on the Purvanchal Expressway in Barabanki, Uttar Pradesh, early on Monday", rights: "", rank: 12, topic: "", country: "", language: "", authors: "", media: "https://s.yimg.com/uu/api/res/1.2/Okf7Q9awKssAiiWBT7dArA--~B/aD0yMjU7dz0zMDA7YXBwaWQ9eXRhY2h5b24-/https://media.zenfs.com/en/wpxi_cox_articles_540/d517af909bc6a20fc1ccdef26d2e2991", isOpinion: true, twitterAccount: "", score: 123, id: "233"))


                    NewsCard(article: Article(title: "new2", author: "", publishedDate: "2022-07-25 02:10:18", publishedDatePrecision: "", link: "", cleanURL: "", summary: "Here are today's top news, analysis and opinion. Know all about the latest news and other news updates from Hindustan Times.Eight die, 20 hurt as double-decker buses collide on UP's Purvanchal ExpresswayAt least eight people died and 20 others were injured after a stationary double-decker bus on the roadside was hit by a speeding double-decker bus on the Purvanchal Expressway in Barabanki, Uttar Pradesh, early on Monday", rights: "", rank: 12, topic: "", country: "", language: "", authors: "", media: "https://cdn.images.express.co.uk/img/dynamic/79/1200x712/1645388_1.jpg", isOpinion: true, twitterAccount: "", score: 123, id: "2223"))
                }
                    .padding()

            }

        }
            .preferredColorScheme(.dark)
    }
}
