//
//  LoginViewController.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//


import UIKit
import SnapKit

class LoginViewController_SK: UIViewController {

    
    private let titleLabel: UILabel={

        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.numberOfLines = 2
        // 두줄로 띄우려면 엔터쳐주고, 몇줄짜리인지도 저렇게 해주야댐
        label.font = .pretendard(size: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // 당근 로고
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .karrotLogo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 로그인필드 아이디
    private let idTextField: UITextField = {
        let textField = UITextField()
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
        let textField = UITextField()
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

        let loginButton = UIButton()
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
        setLayout()
    }
    
    
    func setUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubviews(logoImage,titleLabel,idTextField,pwTextField,loginButton)
    }
    
    
    func setLayout(){
        
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(169)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(63)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(pwTextField.snp.bottom).offset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(57)
        }
        
      /*  let safeArea = view.safeAreaLayoutGuide
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(122)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(66)
            $0.center.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(66)
            $0.center.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(128)
            $0.center.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(57)
        }
       
       */
        
        
    }
    

        
        
      /*func setLayout() {
          
          NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                       titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 169)])
          
          NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 66),
                                       idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                       idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                       idTextField.heightAnchor.constraint(equalToConstant: 57)
                                      ])
          NSLayoutConstraint.activate([pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 6),
                                       pwTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                       pwTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                       pwTextField.heightAnchor.constraint(equalToConstant: 57)])
          
          NSLayoutConstraint.activate([
              loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 128),
              loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              loginButton.heightAnchor.constraint(equalToConstant: 57)])
      }
       */
      
    
    
    @objc
    private func loginButtonDidTap(){
   //     presentToWelcomeVC()
        navigateToWelcomeVC( )
        
    }
    
    // 화면 전환 프레젠트 함수
    func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        self.present(welcomeViewController, animated: true)
        
    }
    
    func navigateToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}
