//
//  AppDelegate.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
/* 앱델리게이트: 윈도우(시각적요소 x 배경막, 윈도우에 뷰가 올라가잇음)의 UI상태를 관리
원래!  1앱 1윈도우 엿는데 iOS13부터 하나의 앱이 여러 윈도우를 갖기 시작하여,
 멀티 윈도우를 지원하기 위해 윈도우의 개념을 씬으로 대체하고, 씬델리게이트 등장
 앱델리게이트가 하던 UI Lifecycle관리를 담당하게됨*/
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

