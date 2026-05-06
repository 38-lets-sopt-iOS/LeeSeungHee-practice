//
//  SigininRequestDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation


struct SigninRequestDTO : Encodable {
    let loginId: String
    let password: String
}

