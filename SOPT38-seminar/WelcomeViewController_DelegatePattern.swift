//
//  WelcomeViewController.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/4/26.
//

import Foundation
// uikit에 파운데이션 포함이라 지워도댐
import UIKit
class WelcomeViewController_DelegatePattern
: UIViewController {
    
    weak var delegate: RetryLoginDelegateProtocol?

    
    private var id : String? = ""
    // ? 를 붙이면 옵셔널 됨 스페이스바하면안됨;;;그리고 =는 또 꼭 스페이스바 띄워줘야됨 양옆
    //프라이빗은 밖에서 접근못하게한다는
    //컨피규어함수도 그  음 웰컴뷰컨트롤러에 컨피규어함수가 잇는거임 그러면 아이디가 이미 드간상태ㅐ에서 뷰가 띄워지는거임
    //웰컴뷰컨트롤러가 나오기전에 컨피규어 함수가 미리 아이디값을 정해주고 가는거임
    
    func configure(id: String?){
        self.id = id
        if let id = id {
               welcomeLabel1.text = "\(id)님"
           } else {
               welcomeLabel1.text = "당근님!"
           }
        //welcomeLabel.text = "\(id)님\n반가워요!"
    }
    
    
    //이미지
    let imageView: UIImageView = {
        let imageView = UIImageView(frame:CGRect(x:112,y:87,width:150,height:150))
        imageView.image = .karrot
        return imageView
    }()
    
    //타이틀 라벨 (변하지 않는 텍스트)
    let welcomeLabel1: UILabel={
        let label = UILabel(frame:CGRect(x:140,y:295,width:100,height: 60))
        label.text = "???님"
        label.font = .pretendard(size: 25, weight:.bold)
        
        label.textAlignment = .center
        return label
    }()
    let welcomeLabel2: UILabel={
        let label = UILabel(frame:CGRect(x:140,y:335,width:100,height: 60))
        label.text = "반가워요!"
        label.textColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        //그림자 추가
        label.shadowColor = .black
        label.shadowOffset = CGSize(width: 0.5, height: 0.5)
        label.font = .pretendard(size: 25, weight:.bold)
        label.textAlignment = .center
        return label
    }()
    
    //메인으로 가는 버튼
    let mainButton: UIButton = {
        let mainButton = UIButton(frame:CGRect(x:20,y:426,width:335,height:52))
        mainButton.backgroundColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        mainButton.setTitle("메인으로", for: .normal)
        mainButton.layer.cornerRadius = 10
        mainButton.clipsToBounds = true
        mainButton.setTitleColor(.white,for: .normal)
        mainButton.titleLabel?.font = .pretendard(size: 18, weight:.bold)
        return mainButton
    }()
    
    //다시 로그인하는 버튼
    let reloginButton: UIButton = {
        let reloginButton = UIButton(frame:CGRect(x:20,y:495,width:335,height:52))
        reloginButton.backgroundColor = .systemGray4
        reloginButton.setTitle("다시로그인", for: .normal)
        reloginButton.layer.cornerRadius = 10
        reloginButton.clipsToBounds = true
        reloginButton.setTitleColor(.gray, for: .normal)
        reloginButton.titleLabel?.font = .pretendard(size: 18, weight:.bold)
        reloginButton.addTarget(self,action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return reloginButton
    }()
    
    //스위치 추가
    func setUISwitch(){
        let switchOnOff = UISwitch()
        switchOnOff.isOn = false
        switchOnOff.onTintColor = UIColor(red:255/255,green:111/255, blue:15/255, alpha:1)
        switchOnOff.thumbTintColor = .white
        switchOnOff.frame = CGRect(x:160,y:257,width:50,height:50)
        self.view.addSubview(switchOnOff)
        switchOnOff.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
//        bindID()
    }
    
    func setUI() {
        view.addSubviews(welcomeLabel1,welcomeLabel2,mainButton
        ,imageView,reloginButton)
        
        setUISwitch()
    }
    
    
    @objc
    private func backToLoginButtonDidTap() {
        
        if let id = id {
            delegate?.retryLogin(id: id)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
 //스위치
    @objc
    private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .yellow
        } else {
            view.backgroundColor = .white
        }
    }
    
    func bindID() {
        if let id = id {
               welcomeLabel1.text = "\(id)님\n반가워요!"
           } else {
               welcomeLabel1.text = "당근님\n반가워요!"
           }
       // welcomeLabel.text = "\(id)님\n반가워요!"
    }
    
    
}

protocol RetryLoginDelegateProtocol: AnyObject {
    // 애니오브젝트를 채택하면 클래스에서만 사용가능함, 구조체나 열거형에서 사용 못함
    func retryLogin(id: String)
}

