//
//  SOPT_38_SwiftUIApp.swift
//  SOPT-38-SwiftUI
//
//  Created by 초긍정행운의포춘쿠키 on 5/16/26.
//

import SwiftUI

@main
struct SOPT_38_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            StoryView(story: users) //씬델리게이트 (앱의 시작점, 앱이 실행되면 가장 먼저 여기 실행)
        }
    }
}
