//
//  GetUserInfoService.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//


import Foundation

final class GetUserInfoService {
    //MARK: - 0) Singleton 객체 생성
    static var shared = GetUserInfoService()
    private init() {}

    //MARK: - 1) makeRequest (GET은 body가 없다)
    private func makeRequest(userId: Int) throws -> URLRequest {

        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else { throw NetworkError.urlError}
        
        let baseUrl = baseURL
        print (baseUrl)
        let path = "/api/v1/users/\(userId)"
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
        return request
    }
    
//MARK: - 2) 외부 호출 함수
    func getUserInfo(userId: Int) async throws -> GetUserInfoResponseDTO {
            let request = try makeRequest(userId: userId)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump("Request \(request)")
            
            guard let httpRespones = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump("Response \(response)")
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response Body: \(responseString)")
            }
            guard(200...299).contains(httpRespones.statusCode) else {
                throw configureHTTPError(errorCode: httpRespones.statusCode)
            }
            do{
                let decoded = try JSONDecoder().decode(GetUserInfoResponseDTO.self, from: data)
                print(decoded)
                return decoded
            } catch {
                throw error}
        }
        
        
        private func configureHTTPError(errorCode: Int) -> Error{
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }


} //end
