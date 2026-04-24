//
//  ScrollViewPractice.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/11/26.
//


import UIKit

import SnapKit

class ScrollViewPractice2: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let orangeView = UIView()
    private let greenView = UIView()
    private let redView = UIView()
    private let yellowView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        orangeView.backgroundColor = .orange
        greenView.backgroundColor = .green
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [orangeView, greenView,redView,yellowView,blueView,purpleView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalToSuperview().dividedBy(2)
        }
        
       orangeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.height.equalTo(337)
            $0.width.equalToSuperview().dividedBy(2)
            
            
            yellowView.snp.makeConstraints  {
                $0.top.equalTo(orangeView.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(337)
                $0.width.equalToSuperview().dividedBy(2)
            }
            greenView.snp.makeConstraints {
                $0.top.equalTo(redView.snp.bottom)
                $0.leading.equalTo(yellowView.snp.trailing)
                $0.height.equalTo(337)
                $0.width.equalToSuperview().dividedBy(2)
            }
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalToSuperview().dividedBy(2)
        }
        
        purpleView.snp.makeConstraints{
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.height.equalTo(337)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(2)
            
        }
    }
}
