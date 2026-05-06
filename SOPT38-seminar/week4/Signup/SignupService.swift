//
//  SignupService.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 5/2/26.
//

import Foundation

final class SignupService {
    static var shared = SignupService()
    private init() {}
 
    //MARK: - 리퀘 바디 만들기
    private func makeRequestBody(loginId: String, password: String, name: String, email: String, age: Int, part: String) -> Data? {
        
        do{
            let data = SignupRequestDTO(
                loginId: loginId,password: password, name: name, email: email, age: age, part: part)
            // 현재 data 는 DTO에 이 함수의 인자를 넣은 것
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            // try 가 에러를 던지는 분이라 do - catch 문 사용해서 encode
            return requestBody
            // Data? 에 json 화 된 리퀘바디 반환
        } catch {
            print(error)
            return nil
            // Data? 에 nil 반환
        }
    }
    //MARK: - 리퀘 만들기
    //위의 반환값인 Data? 가 body 로 들어감
    // throws 는 이 함수가 실패해서 에러를 던질수 잇다는 뜻...
    // 암튼 body에는 위에서 만든 Data? 가 들어감 .. nil일수도 requestBody 일수도
    private func makeRequest(body: Data?) throws -> URLRequest {
        //URLRequest 는 swift에 원래 있는 타입( in foundation), 네트워크 요청을 만들때 쓰는 기본 구조체!!
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else { throw NetworkError.urlError}
        // 아까 info에 등록한 BASE_URL이 존재하면,(옵셔널바인딩) baseURL에 담는거인듯
        
        let baseUrl = baseURL
        print (baseUrl)
        let path = "/api/v1/auth/signup"
        // 명세서에 기능마다 엔드포인트가 따로 있어서 코드 재활용할수잇게..? 이런 구조로 접근해야할 주소를 만드는건가봐
        let url = baseUrl + path
        print (url)
        // 아랫줄의 URL 역시 웹 주소를 표현하는 구조체 로 swift에 원래 있는 타입!!
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        } // encodeurl 에 방금 만든 url을 넣음, 이것도 바인딩햇네, 없으면 에러뱉음
        
        var request = URLRequest(url: encodedurl)
        // url이 방금 만든 encodedUrl 이고 타입이 URLRequest 인 프로퍼티를 request 라는 이름으로 선언
        request.httpMethod = "POST"
        // URLRequest의 메서드 오오오..
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        } // 뭐지여긴?
        
        if let body = body {
            request.httpBody = body
        } // body 옵셔널이었으니까 바인딩해서, 존재 시 request인스턴스의 httpbody에 넣음
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("request Body: \(str)")}
        return request
        //이렇게 request에 encoded url, httpmethod, header, body 다 드간상태로 반환됏다   (makeRequest햇네 진짜..)
    }
    
//MARK: -   postSignup!!!! 최종적으로 호출할 함수
    // 위에서 만든거 다 때려넣음
    func postSignup(loginId: String,
                        password: String,
                        name: String,
                        email: String,
                        age: Int,
                        part: String) async throws -> SignupResponseDTO {
            // 비동기는 나중에.. 일단  request에 잇는거 받아서 Response DTO 반환
            guard let body = makeRequestBody(loginId: loginId, password: password, name: name, email: email, age: age, part: part)
            else { throw NetworkError.requestEncodingError}
            // body에 make리퀘바디 함수 바인딩(반환값이옵셔널)
            let request = try makeRequest(body: body)
            // request에 make리퀘 함수의 결과 (에러나올수잇어서 try)
            let (data, response) = try await URLSession.shared.data(for: request)
            //위에서 선언한  request 를 보내고, 결과를 (data, response)로 받아와라  라는 뜻이라고함
            dump("Request \(request)")
        // 콘솔에 찍는용
            
            guard let httpRespones = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            
            dump("Response \(response)")
        // 콘솔에 찍는 용
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response Body: \(responseString)")
            }
            // respons 를  왜 decode 아닌  encode..?
            // 문자열로 찍어보는거래 (...도대체 왜?)
            guard(200...299).contains(httpRespones.statusCode) else {
                throw configureHTTPError(errorCode: httpRespones.statusCode)
            }
            // 200번대면 넘어가고 아니면 에러 던짐
            do{
                let decoded = try JSONDecoder().decode(SignupResponseDTO.self, from: data)
                print(decoded)
                return decoded
            } catch {
                throw error}
            //try 때문에 또 do - catch 문 썻고, 이 안에서 SignupResponseDTO를 디코드헤서 결국 decoded 반환
        }
        
        
        private func configureHTTPError(errorCode: Int) -> Error{
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }


} //end

