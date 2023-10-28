//
//  ImageCollectionData.swift
//  SOPT33_assignment3
//
//  Created by Gahyun Kim on 2023/10/28.
//
import UIKit

struct ImageCollectionData {
    let image: String
    var isLiked: Bool
    
    init(image: String, isLiked: Bool) {
        self.image = image
        self.isLiked = isLiked
    }
}

var imageCollectionList: [ImageCollectionData] = [.init(image: "image4", isLiked: true),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: true),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: true),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: true),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: true),
                                                  .init(image: "image9", isLiked: true),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image4", isLiked: true),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: false),
                                                  .init(image: "image11", isLiked: false),
                                                  .init(image: "image4", isLiked: true),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image9", isLiked: false),
                                                  .init(image: "image10", isLiked: true),
                                                  .init(image: "image11", isLiked: true)]
