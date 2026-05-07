//
//  EditRequestDTO.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation

struct EditUserRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
