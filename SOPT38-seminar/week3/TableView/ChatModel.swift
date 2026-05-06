//
//  ChatModel.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//
import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .c1, name: "이나연", place: "공덕", message: "내말에답장해줘", itemImg: .r1),
            ChatModel(profileImg: .c2Krn, name: "김수민", place: "돌곶이", message: "로봇안만듭니다", itemImg: .r2),
            ChatModel(profileImg: .c3Yys1, name: "이상엽", place: "별내", message: "나는야경기도민", itemImg: .r3),
            ChatModel(profileImg: .c4Yys2, name: "김경택", place: "용산", message: "저거 혹시 얼마에 파시나요?", itemImg: .r4),
            ChatModel(profileImg: .c5Cew, name: "김세령", place: "미국", message: "답장이 너무 늦었죠", itemImg: .r5),
            ChatModel(profileImg: .c6Mj, name: "정교은", place: "중국", message: "네고해주세요!!", itemImg: .r6),
            ChatModel(profileImg: .c7Sz, name: "이승희", place: "일본", message: "네고안됩니다", itemImg: .r7),
            ChatModel(profileImg: .c8Mk1, name: "임성환", place: "태국", message: "네.", itemImg: .r8),
            ChatModel(profileImg: .c9Jcw, name: "장지인", place: "명왕성", message: "나 아요 아기", itemImg: .r9),
            ChatModel(profileImg: .c10Bjh, name: "신서연", place: "안드로메다", message: "수고하세용", itemImg: .r10),
            ChatModel(profileImg: .c11Mk2, name: "이서영", place: "뭘보슈", message: "집에갈래", itemImg: .r11),
            ChatModel(profileImg: .c1, name: "최주희", place: "흠", message: "얍얍", itemImg: .r1)
        ]
    }
}
