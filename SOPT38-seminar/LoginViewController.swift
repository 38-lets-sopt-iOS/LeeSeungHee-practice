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

    private let titleLabel: UILabel={
        /* 라벨 (변하지 않는 텍스트)을 만들때
         let a = UILabel = { ~~~ }  : UILabel 객체를 하나 생성하고 중괄호 안에서 값을 결정
         return label: 그 값을 밖으로 넘김 (UILabel에 담음)
         a가 그 박스를 가리킴.. 실행순서가 헷갈림
         
        */
        let label = UILabel(frame:CGRect(x:76,y:245,width:236,height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.numberOfLines = 2
        // 두줄로 띄우려면 엔터쳐주고, 몇줄짜리인지도 저렇게 해주야댐
        label.font = .pretendard(size: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // 당근 로고
    private let logoImage: UIImageView = {
        let imageView = UIImageView(frame:CGRect(x:126,y:100,width:120,height:120))
        imageView.image = .karrotLogo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 로그인필드 아이디
    private let idTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:316,width:335,height:52))
        textField.placeholder = "아이디"
        // label - text  / textfield - placeholder
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .pretendard(size: 14, weight: .semibold)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 비밀번호필드?
    private let pwTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:376,width:335,height:52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .pretendard(size: 14, weight: .semibold)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 로그인버튼
    lazy var loginButton: UIButton = {
        /*let을 레이지 바 로 바꾸면 오류가 없어지는 이유
         우선 오류가 나는 이유는 loginButton.addTarget(self ..여기의
         self 때문이다. 렛은 객체가 생성되는 동시에 초기화가 되는데,
         이 때 이 시점에서는 self가 만들어지지 않아서 오류가 발생한다.
         lazy var는 처음 '사용'할대 초기화가 되어서 viewDidLoad이후 셀프가
         완전히 생성된 상태라서 사용가능하다.
         여기서도 클로저를 {} 사용해서 실행해서 나온 결과를 var 변수에 넣게 되는데,
         음
        */
        let loginButton = UIButton(frame:CGRect(x:20,y:480,width:335,height:52))
        loginButton.backgroundColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.titleLabel?.font = .pretendard(size: 18, weight: .bold)
        //버튼은 titlelabel 로 변경..
        loginButton.setTitleColor(.white,for: .normal)
        loginButton.addTarget(self,action: #selector(loginButtonDidTap), for: .touchUpInside)
        return loginButton
    }()
    
    // 뷰디드로드 를 변경? 오버라이드는 수정이라고 햇는데
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    func setUI() {
        view.addSubviews(logoImage,titleLabel,idTextField,pwTextField,loginButton)
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
        
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

// 커맨드슬래시 주석 단축키 컨트롤아이 정렬 단축키
/* closure
 func addition (_a: Int, _b:Int) -> Int { return a+b }
 이게 걍 함수?
 let additon = { ((a:Int, b:Int) -> Int in return a+b }
 이 함수가 클로저 형태인듯한데
 */
