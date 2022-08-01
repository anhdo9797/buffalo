//
//  SoccerItem.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import SwiftUI

struct SoccerItem: View {
    let soccerItem: SoccerModel;
    var body: some View {
        ZStack(alignment: .bottom) {
            IWebView(text: soccerItem.videos?[0].embed ?? "")
                .frame(width: .infinity, height: 200, alignment: .center)
                .cornerRadius(4, corners: [.allCorners])
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text(soccerItem.title ?? "")
                        .foregroundColor(Color.theme.textPrimary)
                        .font(.body)
                        .fontWeight(.bold)

                    Text(soccerItem.date ?? "")
                        .font(.callout)
                        .foregroundColor(Color.theme.textPrimary)
                }

                Spacer()
                Button(action: { }) {
                    Circle()
                        .overlay {
                        Image(systemName: "heart")
                            .foregroundColor(Color.theme.textPrimary)
                    }
                        .frame(width: 32, height: 32, alignment: .center)

                }
            } .padding(.horizontal)
                .padding(.vertical, 4)
                .background(Color.theme.background200.opacity(0.9))
                .frame(alignment: .bottom)
                .cornerRadius(4, corners: [.bottomLeft, .bottomRight])

        }
        .padding(.bottom)


    }
}

struct SoccerItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SoccerItem(soccerItem: SoccerModel(title: "VN - Thai ", embed: "", url: "", thumbnail: "", date: "12-12-2022", competition: Competition(name: "", id: 123, url: "123"), videos: [Video(title: "123", embed: "<div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;background:#000;'><iframe src='https://www.scorebat.com/embed/v/62df3e369965e/?utm_source=api&utm_medium=video&utm_campaign=dflt' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'></iframe></div>")])
            )

            SoccerItem(soccerItem: SoccerModel(title: "VN - Thai ", embed: "", url: "", thumbnail: "", date: "12-12-2022", competition: Competition(name: "", id: 12333, url: "123"), videos: [Video(title: "123", embed: "<div style='width:100%;height:0px;position:relative;padding-bottom:56.250%;background:#000;'><iframe src='https://www.scorebat.com/embed/v/62df32f566142/?utm_source=api&utm_medium=video&utm_campaign=dflt' frameborder='0' width='100%' height='100%' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;'></iframe></div>")])
            )
            Spacer()
        }
            .padding()
            .background(Color.theme.background)


    }
}
