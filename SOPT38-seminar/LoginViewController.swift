//
//  LoginViewController.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//

import Foundation
// uikit에 파운데이션 포함이라 지워도댐
import UIKit
/*UIView: 여러 UI를 담는 바구니, 0개 이상의 Subview에 대한 레이아웃을 관리
 
 NSObject > UIResponder > UIApplication/ViewController, UIView
  ㄴ UIResponder의 subclass로서 touch등 여러event에 반응
 
UIView> UIImageView,UILabel, UIScrollView, UIWindow, UIControll
    UIControll > UIButton, UITextField, UISlider, UISwitch,..*/

class LoginViewController: UIViewController {
/* UIViewController 내부에 var view : UIView 가 존재함
 뷰컨트롤러안에 유아이뷰 라는 타입의 view 변수가 있어서 내가 지금 view.를 찍음으로써
 UIView 안의 메서드(라벨, 컨트롤>버튼, 이미지뷰 등)를 사용할 수 잇는거임
 UIViewController가 UIView 기능을 가진게 아니고 UIView를 속성으로 갖고잇어서 사용하는것
 */

    let titleLabel: UILabel={
        // 라벨 (변하지 않는 텍스트)
        let label = UILabel(frame:CGRect(x:76,y:169,width:236,height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.numberOfLines = 2
        // 두줄로 띄우려면 엔터쳐주고, 몇줄짜리인지도 저렇게 해주야댐
        label.font = .pretendard(size: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // 로그인필드 아이디
    let loginTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:276,width:335,height:52))
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .systemFont(ofSize: 14)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 비밀번호필드?
    let pwTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:335,width:335,height:52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .systemFont(ofSize: 14)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 로그인버튼
    lazy var loginButton: UIButton = {
        // let을 레이지 바 로 바꾸면 오류가 없어지는데 왤까?
        let loginButton = UIButton(frame:CGRect(x:20,y:450,width:335,height:52))
        loginButton.backgroundColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.setTitleColor(.white,for: .normal)
        loginButton.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(pwTextField)
        view.addSubview(loginButton)
    }
    
    @objc
    private func loginButtonDidTap(){
   //     presentToWelcomeVC()
        navigateToWelcomeVC( )
        
    }
    
    // 화면 전환 프레젠트 함수
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        // 변수이름은 보통 소문자로 시작하고 뷰컨트롤러는 대문자로 그리고 그리고 이거를 이 변수에 이걸 등록한거임
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
        
    }
    
    func navigateToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        //이 머가 실행되기 전에 잽싸게 지금 여기아래에다가 이걸 함
        
//welcomeViewController.id = loginTextField.text
        //이 물음표 없으면 에러난다구함 이게 ?? 이거를 붙이면 optional 타입이됨, 값할당되면 그거되고 아니면 nil값
        //??"" 를 지우고 쩌기에 string 뒤에 ? 를붙엿음
        
        welcomeViewController.configure(id: loginTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

// 커맨드슬래시 주석 단축키 컨트롤아이 정렬 단축키
