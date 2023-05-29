//
//  NetworkManager.swift
//  H4X0R News-SwiftUI
//
//  Created by Peiyun on 2023/5/26.
//

import Foundation

//ObservableObject: 當 property 改變時，它將自動更新畫面，讓畫面能夠跟參數連動
class NetworkManager: ObservableObject{
    
    //@Published:SwiftUI中非常好用的wrapper，它允許我們創建”可觀察的”object，當這些object發生更改時會自動宣布通知。SwiftUI將自動監控此類更改，並重新調用data的任何view的body屬性因為跟畫面有關，使用時要將其丟入async內

   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    //建立JSON解碼器
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let results = try decoder.decode(Results.self, from: safeData)
                            //因更新表單屬於畫面範疇，故需加至主佇列
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }    
                        }catch{
                            print(error)
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
}
