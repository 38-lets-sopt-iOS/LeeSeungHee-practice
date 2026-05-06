//
//  ChatTableViewCell.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//

import UIKit
import Then
import SnapKit

final class ChatTableViewCell: UITableViewCell {
//왜 파이널이지
    
    static let identifier = "ChatTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let profPic = UIImageView().then {
        $0.image = UIImage(named: "c6_mj")
    }
    
    private let nameLabel =  UILabel().then {
        $0.text = "이나연"
        $0.textColor = .black
        $0.font = .pretendard(size: 15, weight: .semibold)
    }
    
    
    private let locateLabel = UILabel().then {
        $0.text = "공덕"
        $0.textColor = .gray
        $0.font = .pretendard(size: 12, weight: .semibold)
    }
    
    private let msgLabel = UILabel().then {
        $0.text = "안녕"
        $0.textColor = .black
        $0.font = .pretendard(size: 14, weight: .regular)
    }
    
    private let prodPic = UIImageView().then {
        $0.image = UIImage(named: "r1")
    }
    
    func setUI() {
        self.addSubviews(profPic,nameLabel,locateLabel,msgLabel,prodPic)
    }
    
    func setLayout() {
        
        profPic.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profPic.snp.trailing).offset(13)
            $0.top.equalToSuperview().inset(16)
        }
        
        locateLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(13)
            $0.centerY.equalTo(nameLabel)
        }
        
        msgLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(nameLabel)
        }
        
        prodPic.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }

}

extension ChatTableViewCell {
    func dataBind(_ chatData: ChatModel) {
        profPic.image = chatData.profileImg
        nameLabel.text = chatData.name
        locateLabel.text = chatData.place
        msgLabel.text = chatData.message
        prodPic.image = chatData.itemImg
    }
}

