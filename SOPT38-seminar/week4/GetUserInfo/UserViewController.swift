//
//  MyInfoViewController.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import UIKit

import SnapKit
import Then

final class UserViewController: UIViewController {
    private let titleLabel = UILabel().then{
        $0.text = "내 정보 조회 및 수정"
        $0.font = .systemFont(ofSize: 30, weight: .bold)
    }
    private let idTextField = UITextField()
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let ageTextField = UITextField()
    private let partTextField = UITextField()
    private lazy var editButton = UIButton()
    
    private var currentUserInfo: UserInfo?
    
    private var userId: Int
    
    init(userId: Int = 1) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.userId = 1
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        getUserInfo()
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel,
            idTextField,
            nameTextField,
            emailTextField,
            ageTextField,
            partTextField,
            editButton
        )
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        let placeholder = ["아이디", "이름", "이메일", "나이", "파트"]
        
        [idTextField, nameTextField, emailTextField, ageTextField, partTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.addLeftPadding()
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
            }
        
        ageTextField.keyboardType = .numberPad
        
        idTextField.isEnabled = false
        partTextField.isEnabled = false
        
        editButton.do {
            $0.setTitle("수정하기", for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {     $0.top.equalToSuperview().inset(150)
            $0.leading.equalToSuperview().inset(20)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func applyUserInfo(_ data: UserInfo) {
        currentUserInfo = data
        userId = data.id
        
        idTextField.text = data.loginId
        nameTextField.text = data.name
        emailTextField.text = data.email
        ageTextField.text = "\(data.age)"
        partTextField.text = data.part
    }
    
    private func getUserInfo() {
        Task {
            do {
                let getResponse = try await GetUserInfoService.shared.getUserInfo(userId: userId)
                applyUserInfo(getResponse.data)
            } catch {
                showAlert(title: "회원정보 조회 실패", message: error.localizedDescription)
                print("회원정보 조회 실패", error)
            }
        }
    }
    
    @objc
    private func editButtonDidTap() {
        
        Task{
            do {
                guard currentUserInfo != nil else { return }
                
                let name = (nameTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let email = (emailTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
                let ageText = ageTextField.text ?? ""
                let age = Int(ageText)
                
                if name.isEmpty || email.isEmpty {
                    showAlert(title: "입력 확인", message: "이름과 이메일을 입력해주세요.")
                    return
                }
                if age == nil {
                    showAlert(title: "나이 확인", message: "나이는 숫자로 입력해주세요.")
                    return
                } // nil 이어도 넘어가므로, 잘못된 입력 거르기 위해
                
                let editResponse = try await EditUserService.shared.patchEditUser(
                    userId: userId, name: name, email: email, age: age)
                
                applyUserInfo(editResponse.data)
                
                showAlert(title: "유저 정보를 수정했습니다", message: "수정 완료")
                
                print("회원정보 수정 성공")
            } catch {
                showAlert(title: "회원정보 수정 실패", message: error.localizedDescription)
                print("회원정보 수정 실패", error)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}// end
