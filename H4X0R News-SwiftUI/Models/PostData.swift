//
//  PostData.swift
//  H4X0R News-SwiftUI
//
//  Created by Peiyun on 2023/5/27.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}


//Identifiable: 此協議允許列表能夠根據id識別post對象的順序
//此協議一定要有一個命名為id的字串
struct Post: Decodable, Identifiable{
    //因為要建立名稱為id的變數才可識別，故使用computed property使其相等
    var id: String{
        return objectID
    }
    //識別每個Hacker News數據庫中每個帖子的編號
    let objectID:String
    let points:Int
    let title:String
    let url:String?
}
