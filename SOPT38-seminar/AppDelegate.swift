//
//  AppDelegate.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//

import UIKit
/* 프레임워크 라는 분은 자동차 같은것.. 나는 여기에 타서 운전을 ... 자신없지만 그래도 이분 덕분에 차를 만들진 않아도 됨
 프레임워크를 이용하면 전체적인 코드의 흐름이 프레임워크에 달리게 됨 (제어의 역전)
 UIKit가 뼈대를 주고 내가 거기에 코드를 짜넣는 느낌인것같음 그래서 프레임워크가 개발자의 코드를 호출하는 셈
 Cocoa Touch Framework 라는 통합프레임워크 내에 >  UIKit, Foundation, ... 이 있다
  코터프 님의 특징: Objective-c 런타임 시스템의 최상위 클래스인 NSObject를 상속한다
  ㄴ 객체지향프로그래밍을 가능하게 만들어주는 핵심요소, 이를 상속받는 하위클래스들은 런타임시스템에 대한 기본인터페이스와 Object-c객체처럼 동작할 수 잇는 기능을 상속받는다..즉, 기본적인 객체 동작 제공, 런타임 기능 지원 ,자동 메모리 관리, 객체 생명주기 관리..
 기본적으로 UIKit의 핵심 클래스들이 NSObject를 상속 : NSObject > UIResponder> UIView, UIVC, UIApplication
 그래서 자연스럽게 이 컴포넌트들은 NSObject의 KVO,Runtime같은 기능들을 사용할수잇음 / SwiftUI는 View프로토콜이라 NSObject를 상속받지않음 ... 일단 정리는 햇는데 무슨말인지잘모르겟다*/

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

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

