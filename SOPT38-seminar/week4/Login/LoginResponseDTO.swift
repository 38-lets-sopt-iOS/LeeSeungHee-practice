//
//  SigninResponseDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: String
    let message: String
    let code: String
    let data: userId
    let meta: ErrorResponseDTO?
    // SignupResponseDTO 에 선언된 구조체와 같음
}

struct userId: Decodable {
    let userId: Int
}
