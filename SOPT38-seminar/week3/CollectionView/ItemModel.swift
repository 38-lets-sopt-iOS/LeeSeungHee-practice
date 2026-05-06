//
//  ItemModel.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//
import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .rec1, name: "가나디", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .rec2, name: "오쏘몰", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rec3, name: "애플워치", price: "3000", heartIsSelected: true),
            ItemModel(itemImg: .rec4, name: "가방", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .rec5, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .rec6, name: "틴트", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .rec1, name: "카메라", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .rec2, name: "로션", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rec3, name: "락스", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .rec4, name: "가방", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .rec5, name: "헤드셋", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .rec6, name: "틴트", price: "4000", heartIsSelected: false)
        ]
    }
}

