//
//  GetUserListRequestDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/2/26.
//

struct GetUserListResponseDTO : Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UsersData
}

struct UsersData : Decodable {
    let users: [UserData]
}

struct UserData : Decodable {
    let id : Int
    let name: String
    let part: String
}
