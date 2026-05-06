//
//  AutoLayout.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/11/26.
//

import UIKit

class AutoLayout_Practice: UIViewController {
    
    let nemo_yellow: UIView = {
        let nemo = UIView()
        nemo.backgroundColor = .yellow
        return nemo
    }()
    
    let nemo_green: UIView = {
        let nemo = UIView()
        nemo.backgroundColor = .green
        return nemo
    }()
    
    let nemo_black: UIView = {
        let nemo = UIView()
        nemo.backgroundColor = .black
        return nemo
    }()
    
    let nemo_blue: UIView = {
        let nemo = UIView()
        nemo.backgroundColor = .blue
        return nemo
    }()
    
    func setUI() {
        nemo_yellow.translatesAutoresizingMaskIntoConstraints = false
        nemo_green.translatesAutoresizingMaskIntoConstraints = false
        nemo_black.translatesAutoresizingMaskIntoConstraints = false
        nemo_blue.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubviews(nemo_yellow,nemo_green,nemo_black,nemo_blue)
    }
    
    func setLayout() {
    NSLayoutConstraint.activate([
            nemo_yellow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nemo_yellow.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            nemo_yellow.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
        ])
        
        NSLayoutConstraint.activate([
                nemo_green.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                nemo_green.topAnchor.constraint(equalTo: nemo_yellow.bottomAnchor),
                nemo_green.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                nemo_green.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            ])
        
        NSLayoutConstraint.activate([
                nemo_black.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                nemo_black.topAnchor.constraint(equalTo: nemo_green.bottomAnchor),
                nemo_black.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                nemo_black.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            ])
        
        NSLayoutConstraint.activate([
                nemo_blue.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                nemo_blue.topAnchor.constraint(equalTo: nemo_black.bottomAnchor),
                nemo_blue.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                nemo_blue.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4),
            ])
        
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    
}
