//
//  ChatListModel.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//
import SwiftUI

struct ChatListModel :Identifiable {
    let id: UUID = UUID()
    let profileImg: ImageResource
    let name: String
    let place: String
    let message: String
    let itemImg: ImageResource
}

extension ChatListModel {
    static let chatDummy: [ChatListModel] = [
            ChatListModel(profileImg: .c1, name: "이나연", place: "공덕", message: "내말에답장해줘", itemImg: .r1),
            ChatListModel(profileImg: .c2Krn, name: "김수민", place: "돌곶이", message: "로봇안만듭니다", itemImg: .r2),
            ChatListModel(profileImg: .c3Yys1, name: "이상엽", place: "별내", message: "나는야경기도민", itemImg: .r3),
            ChatListModel(profileImg: .c4Yys2, name: "김경택", place: "용산", message: "저거 혹시 얼마에 파시나요?", itemImg: .r4),
            ChatListModel(profileImg: .c5Cew, name: "김세령", place: "미국", message: "답장이 너무 늦었죠", itemImg: .r5),
            ChatListModel(profileImg: .c6Mj, name: "정교은", place: "중국", message: "네고해주세요!!", itemImg: .r6),
            ChatListModel(profileImg: .c7Sz, name: "이승희", place: "일본", message: "네고안됩니다", itemImg: .r7),
            ChatListModel(profileImg: .c8Mk1, name: "임성환", place: "태국", message: "네.", itemImg: .r8),
            ChatListModel(profileImg: .c9Jcw, name: "장지인", place: "명왕성", message: "나 아요 아기", itemImg: .r9)
        ]
    }

