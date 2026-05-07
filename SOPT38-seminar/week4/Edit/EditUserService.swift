//
//  EditService.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/7/26.
//

import Foundation

final class EditUserService {
    //MARK: - 0) Singleton 객체 생성
    
    static var shared = EditUserService()
    private init() {}
    
    //MARK: - 1) makeRequestBody 함수로 encoded 데이터(JSON) 생성
    private func makeRequestBody(name: String?, email: String?, age: Int?) -> Data? {
        
        do{
            let data = EditUserRequestDTO(
                name: name,email: email, age: age)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
            // 인자를 RequestDTO에 넣어 encode 하여 반환
        } catch {
            print(error)
            return nil
        }
    }
    //MARK: - 2) makeRequest 함수로 url을 담은 request 객체(URLRequest) 생성
    private func makeRequest(userId: Int, body: Data?) throws -> URLRequest {
        //URLRequest 는 swift에 원래 있는 타입( in foundation), 네트워크 요청을 만들때 쓰는 기본 구조체
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
        // request는 encodedurl 정보를 가진 URLRequest 타입
        request.httpMethod = "PATCH"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("request Body: \(str)")}
        return request
    }
    
    //MARK: -  3) 외부 호출 함수
    // 인자로 body, request를 각각 생성 후 URLSession으로 data 와 response를 받아와 decoded를 반환
    func patchEditUser(userId: Int,
                       name: String?,
                       email: String?,
                       age: Int?) async throws -> EditUserResponseDTO {
        guard let body = makeRequestBody(name: name, email: email, age: age)
        else { throw NetworkError.requestEncodingError}
        let request = try makeRequest(userId: userId, body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        //튜플에 값을 저장
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
            let decoded = try JSONDecoder().decode(EditUserResponseDTO.self, from: data)
            print(decoded)
            return decoded
        } catch {
            throw error}
        
    }
    
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
    
    
} //end
