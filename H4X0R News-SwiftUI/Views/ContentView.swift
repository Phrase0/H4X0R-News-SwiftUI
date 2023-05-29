//
//  ContentView.swift
//  H4X0R News-SwiftUI
//
//  Created by Peiyun on 2023/5/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            //建立表單的方法
            //            List{
            //                Text("Hello1")
            //                Text("Hello2")
            //                Text("Hello3")
            //            }
            List(networkManager.posts, rowContent: { post in
                //NavigationLink:此導航連接將在每個單元格右側創建一個按鈕。可以將每個NavigationLink想像成一個單元格，以前在單元格內容中的內容現在則成為NavigationLink的標籤
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            })
            //設定title
            .navigationTitle("H4X0R NEWS")
        }
        //onAppear與swift內viewDidLoad類似
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//測試：
//Identifiable: 此協議允許列表能夠根據ID識別post對象的順序
//此協議一定要有一個命名為id的字串
//struct Post: Identifiable{
//    let id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Hello2"),
//    Post(id: "3", title: "Hello3")
//]
