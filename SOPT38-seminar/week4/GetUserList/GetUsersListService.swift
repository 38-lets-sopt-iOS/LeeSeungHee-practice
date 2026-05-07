//
//  GetUserListService.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/2/26.
//

import Foundation

final class GetUsersListService {
    //MARK: - 0) Singleton 객체 생성
    static var shared = GetUsersListService()
    private init() {}
    //MARK: - 1)  makeRequest
    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else { throw NetworkError.urlError}
        
        let baseUrl = baseURL
        print (baseUrl)
        let path = "/api/v1/users"
        let url = baseUrl + path
        print (url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")}
        
        return request
    }
    //MARK: - 2) 외부 호출 함수
    func getUserList() async throws -> GetUserListResponseDTO {
        
        let request = try makeRequest(body: nil)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpRespones = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpRespones.statusCode) else {
            throw configureHTTPError(errorCode: httpRespones.statusCode)
        }
        
        do{
            let decoded = try JSONDecoder().decode(GetUserListResponseDTO.self, from: data)
            print(decoded)
            return decoded
        } catch {
            throw error}
        
    }
    
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }    
    
}//end
