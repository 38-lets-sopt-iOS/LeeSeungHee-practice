//
//  SigninResponseDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: LoginData
    let meta: ErrorResponseDTO?
}

struct LoginData: Decodable {
    let userId: Int
}

/* struct ErrorResponseDTO : Decodable {
 let path: String
 let timestamp: String
}
*/
