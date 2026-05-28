//
//  StoryModel.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//
import SwiftUI

struct StoryModel: Identifiable {
    let id: UUID
    let name: String
    let message: String
}

let users: [StoryModel] = [
    StoryModel(id: UUID(), name: "나연", message: "듀듀듀"),
    StoryModel(id: UUID(), name: "소은", message: "영화 보러 가자요"),
    StoryModel(id: UUID(), name: "승희", message: "버블티머글사람"),
    StoryModel(id: UUID(), name: "교은", message: "내일 점심 어때요?"),
    StoryModel(id: UUID(), name: "지인", message: "내 말 들리나요")
]

