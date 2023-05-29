//
//  WebView.swift
//  H4X0R News-SwiftUI
//
//  Created by Peiyun on 2023/5/29.
//

import Foundation
import WebKit
//還要導入SwiftUI
import SwiftUI

//因目前WebView尚無法在SwiftUI內使用，故需建立UIKit
//UIViewRepresentable：此協議可以創建一个代表UIKitView的SwiftUIView
struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    //將some UIView 改為WebView.UIViewType，再改為WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    //這裡創建的UIViewType並非WebView，故需改成WKWebView
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString, let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
        }
    }
}
