//
//  LoginViewController.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//

import UIKit

class LoginViewController_DelegatePattern: UIViewController{


    private let titleLabel: UILabel={

        let label = UILabel(frame:CGRect(x:76,y:245,width:236,height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.numberOfLines = 2
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
     let idTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:316,width:335,height:52))
        textField.placeholder = "아이디"
        //둥글게
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .pretendard(size: 14, weight: .semibold)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 비밀번호필드
    private let pwTextField: UITextField = {
        let textField = UITextField(frame:CGRect(x:20,y:376,width:335,height:52))
        textField.placeholder = "비밀번호"
        //둥글게
        textField.layer.cornerRadius = 10
        textField.backgroundColor = UIColor(red:221/255, green:222/255, blue:227/255, alpha:1)
        textField.font = .pretendard(size: 14, weight: .semibold)
        textField.leftView = UIView( frame: CGRect(x:0,y:0,width:23,height:0))
        textField.leftViewMode = .always
        return textField
    }()
    
    // 로그인버튼
    lazy var loginButton: UIButton = {

        let loginButton = UIButton(frame:CGRect(x:20,y:480,width:335,height:52))
        loginButton.backgroundColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        //둥글게
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.titleLabel?.font = .pretendard(size: 18, weight: .bold)
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
        view.addSubviews(logoImage,titleLabel,idTextField,pwTextField,loginButton)
    }
    
    @objc
    private func loginButtonDidTap(){
   //     presentToWelcomeVC()
        navigateToWelcomeVC( )
        
    }
    
    // 화면 전환 프레젠트 함수
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
        
    }
    
    func navigateToWelcomeVC(){
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.configure(id: idTextField.text)
        welcomeViewController.delegate = self
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

extension LoginViewController_DelegatePattern: RetryLoginDelegateProtocol{
    func retryLogin(id: String) {
        idTextField.text = ""
        pwTextField.text = ""
        titleLabel.text = "\(id)님, 다시 로그인해주세요"
    }
}
