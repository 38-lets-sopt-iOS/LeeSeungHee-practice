//
//  SceneDelegate.swift
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

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//씬델리게이트에 리스폰더와 씬델리게이트가 잇어야하는건가
    var window: UIWindow?

// 1) scene 함수는 UI창을 선택적으로 구성하고 제공된 창에 씬을 연결해준다
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
                            //UIScene은 앱의 윈도우와 뷰를 관리하는 핵심 객체
        
        /*guard문: 조건이 충족되지 않을대 코드의 실행을 중단한다
         guard 조건 else {} 꼴*/
        guard let windowScene = (scene as? UIWindowScene) else { return }
         //Scene이 UIWindowScene이 아니면 실행 중단
        
        let loginViewController = SignupViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        // 네비게이션 컨트롤러 추가
        
 //* 스토리보드 없이 코드로만 앱의 첫.화면을 구성하는 경우 이 코드를 사용한다
        let window = UIWindow(windowScene: windowScene)
        //UIWindowScene은 앱의 가장 기본적인 컨테이너, 모든 뷰, 뷰컨트롤러는 이 윈도우 위에*/
        window.rootViewController = navigationController
        // 윈도우의 루트뷰를 네비게이션 컨트롤러로 설정
        window.makeKeyAndVisible()
        // 윈도우를 가장 중요한 key 윈도우로 설정 & 사용자에게 보이게 (visible) 만든다
        self.window = window
        //씬델리게이트의 윈도우 속성에 방금 만든 윈도우를 할당한다ㅁ
        //self: 현재 이 메서드를 실행시킨 객체를 가리키는 키워드 ,, 여기선 씬델리게이트?
    }
// 2) 씬 디드 디스커넥트 함수는 씬이 해제되면 호출된다, 씬이 background에 들어가거나 sesion이 삭제되었을대 호출되며 .. 음
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
// 3) 씬 디드 비컴 액티브 : 씬이 활성화되엇고 현재 이벤트에 응답하고 잇음을 알린다
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
// 4) 씬윌리사인액티브 : 씬이 활성상태를 해제하고 사용자 이벤트에 대한 응답을 중지하려함을 알린다 시스템 경고를 표시할때 등 일시적인 중단을 위해 이 메서드를 호출한다
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
//5) 씬윌엔터포어그라운드 : 씬이 foreground에서 실행되고 사용자에게 표시될것임을 델리게이트에게 알린다, 씬이 화면에 표시되기 위해 foreground에 들어가므로 이 메서드는 항상 씬디드비컴액티브 3)번메서드를 호출한다
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
//6) 씬디드엔터백그라운드: 씬이 백그라운드에서 실행되고 더 이상 화면에 표시되지 않음을 델리게이트에게 알린다. 이 방법으로 씬의 메모리 사용량을 줄이고, 이 메서드가 반환된 직후 UIKit는 앱 전환기에 효시하기 위해 씬의 인터페이스 스냅샷을 찍는다. 오오... 내가 이해한게 맞는지모르겟지만 그렇군
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

