//
//  Post.swift
//  Netology_IB_Instruments
//
//  Created by KODDER on 15.03.2022.
//

import UIKit

struct Post {

    let author, description, image: String
    var likes, views: Int
}

let post1 = Post(author: "Comics", description: "На прогулочке с друзьями", image: "first", likes: 15, views: 30)
let post2 = Post(author: "Comics", description: "Сложные отношения...", image: "second", likes: 10, views: 22)
let post3 = Post(author: "Comics", description: "Говорит подвезет", image: "third", likes: 32, views: 57)
let post4 = Post(author: "Comics", description: "Всем пис", image: "fourth", likes: 29, views: 40)
