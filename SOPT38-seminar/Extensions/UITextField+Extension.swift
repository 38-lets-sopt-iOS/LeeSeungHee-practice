//
//  UITextField+Extension.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/2/26.
//
import UIKit

extension UITextField {

//MARK: - Add Padding
    func addLeftPadding(_ width: CGFloat = 15) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 15) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
    
//MARK: - PlaceholderColor
    func placeholderColor(_ color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor: color])
    }
    
} //end
