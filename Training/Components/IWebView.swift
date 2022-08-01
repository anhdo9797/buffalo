//
//  IWebView.swift
//  Training
//
//  Created by phuocanh on 26/07/2022.
//

import SwiftUI
import WebKit
enum webType {
    case text(String)
    case url(String)

}

struct IWebView: UIViewRepresentable {
    let text: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}

struct IWebView_Previews: PreviewProvider {
    static var previews: some View {
        let string = "<div style='width:100%;height:0px;position:relative;padding-bottom:calc(56.25% + 335px);' class='_scorebatEmbeddedPlayerW_'><iframe src='https://www.scorebat.com/embed/g/1152455/?utm_source=api&utm_medium=match&utm_campaign=dflt' frameborder='0' width='560' height='650' allowfullscreen allow='autoplay; fullscreen' style='width:100%;height:100%;position:absolute;left:0px;top:0px;overflow:hidden;' class='_scorebatEmbeddedPlayer_'></iframe></div>";

        IWebView(text: string)
    }
}
