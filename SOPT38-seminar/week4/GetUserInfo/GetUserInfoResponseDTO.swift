//
//  GetUserInfoResponseDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation

struct GetUserInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfo
    let meta: ErrorResponseDTO?
}

struct UserInfo: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

/*
 struct ErrorResponseDTO : Decodable {
 let path: String
 let timestamp: String
}
*/
