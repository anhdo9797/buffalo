//
//  Soccers.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import SwiftUI
import AVKit
struct VideoView: View {
    @StateObject private var vm = SoccerViewModel();
    @State private var offset = CGFloat.zero
    private var idStart: Int = 0

    private var index: Int = 0;
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Videos")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                    .padding()
                    .foregroundColor(Color.theme.textPrimary)

                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(vm.videos, id: \.id) { video in
                                Player(video: video)
                            }


                        }
                            .background(GeometryReader {
                            Color.clear.preference(key: ViewOffsetKey.self,
                                value: -$0.frame(in: .named("scroll")).origin.y)
                        })
                            .onPreferenceChange(ViewOffsetKey.self) { value in
                            print(value)
                            print("offset >> \(value)")
                        }
                    }.coordinateSpace(name: "scroll")


                }
            }

            if vm.isLoading {
                loadingView
            }
        }
    }

}



struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
            .preferredColorScheme(.dark)
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}



struct Player: View {
    let video: VideoModel;
    var player: AVPlayer;


    init(video: VideoModel) {
        self.video = video;
        self.player = AVPlayer(url: URL(string: video.videoFiles?[0].link ?? "")!)


    }

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                VideoPlayer(
                    player: self.player
                )
                    .frame(height: getHeight(videoFile: video.videoFiles![0]))
                    .id(video.id)
                HStack {
                    HStack {
                        Image(systemName: "heart.circle.fill")
                        Text("Like")
                    }.padding().frame(width: (UIScreen.main.bounds.width - 32) / 3)
                    Rectangle()
                        .frame(width: 1)
                    HStack {
                        Image(systemName: "bubble.right")
                        Text("Comment")
                    }.frame(width: (UIScreen.main.bounds.width - 32) / 3)
                    Rectangle()
                        .frame(width: 1)
                    HStack {
                        Image(systemName: "square.and.arrow.up.circle")
                        Text("Share")
                    }.frame(width: (UIScreen.main.bounds.width - 32) / 3)
                    Rectangle()
                        .frame(width: 1)
                }.background(Color.theme.background200.opacity(0.7))
            }
                .padding(.bottom)


        }

    }



}
func getHeight(videoFile: VideoFile?) -> Double {
    let screenWidth = UIScreen.main.bounds.size.width

    let videoHeight = 720.0
    let videoWidth = 1280.0

    let heightHandler = videoHeight * screenWidth / videoWidth
    return heightHandler;
}
