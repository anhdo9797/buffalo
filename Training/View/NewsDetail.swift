//
//  NewsDetail.swift
//  Training
//
//  Created by phuocanh on 25/07/2022.
//

import SwiftUI
import WebKit

struct NewsDetail: View {
    let url: String;
    var body: some View {
        VStack {
            WebView(url: URL(string: url)!)
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(url: "https://google.com")
    }
}

struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
