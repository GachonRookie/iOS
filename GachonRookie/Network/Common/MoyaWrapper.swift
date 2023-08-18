//
//  MoyaWrapper.swift
//  MoyaPractice
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation
import Moya

class MoyaWrapper<Provider : TargetType> : MoyaProvider<Provider> {
    
    /// 디버깅인지 확인하는 변수입니다
    /// true인 경우 해당 response의 metadata를 출력합니다.
    var isDebugging: Bool = true
    
    init(endPointClosure : @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         stubClosure : @escaping StubClosure = MoyaProvider.neverStub/*,
         plugins : [PluginType], isLogin: Bool = false*/){
        
        let session = MoyaProvider<Provider>.defaultAlamofireSession()
        session.sessionConfiguration.timeoutIntervalForRequest = 20
        session.sessionConfiguration.timeoutIntervalForResource = 20
        
//        if Provider.self != MemberAPI.self {
//            plugins = [TokenPlugin(token: myInfo.myToken)]
//        }
        
//        if isLogin == false {
//            plugins.append(TokenPlugin(token: myInfo.myToken))
//        }
        
        super.init(endpointClosure: endPointClosure, stubClosure: stubClosure, session: session/*, plugins: plugins*/)
    }
    
    /// requestSuccessResponse 함수
    /// Model: 디코딩할 모델의 타입입니다. Codable 프로토콜을 준수하는 모델이어야 합니다.
    /// target: Provider 타입의 Moya 타겟(Target) 객체로, API 요청을 정의하는 엔드포인트를 나타냅니다.
    /// instance: 디코딩될 모델 타입의 실제 타입 정보입니다.
    /// completion: API 요청 후 성공 또는 실패에 따라 호출될 클로저입니다. 클로저는 Result 열거형을 통해 성공적인 경우 디코딩된 모델 객체를 반환하거나, 실패한 경우에는 MoyaError를 반환합니다.
    func requestSuccessRes<Model : Codable>(target : Provider, instance : Model.Type , completion : @escaping(Result<Model, MoyaError>) -> () ){
        self.request(target) { result in
            //result는 request결과에 따라 .success와 .failure로 분리됩니다.
            switch result {
            
            // 서버와 통신 성공한 케이스
            case .success(let response):
                // 디버깅 하는 경우
                if self.isDebugging {
                    // response의 metadata를 출력합니다.
                    print("Status Code : \(response.statusCode)")
                    if let json = try? response.mapJSON() as? [String:Any] {
                        if let isSuccess = json["success"] as? Bool, let message = json["message"] as? String/*, let jsonResult = json["result"] */{
                            print("isSuccess : \(isSuccess)")
                            print("message : \(message)")
                            //print("response_result = \(jsonResult)")
                        }
                    }
                    else {
                        let stringData = try? response.mapString()
                        print("response가 JSON 파일이 아닙니다")
                        print("String : \(stringData)")
                    }
                }
               
                // --- case .success의 본 내용입니다.
                // Status Code가 200번대인 경우
                if (200..<300).contains(response.statusCode) {
                    do {
                        //서버에서 공통으로 제공하는 데이터를 Response로 디코딩하고, 내부 데이터는 Model로 받습니다.
                        let responseData = try JSONDecoder().decode(Response<Model>.self, from: response.data)
                        //print(responseData)
                        
                        // 디코딩된 내부 데이터의 결과값만 전달합니다
                        let decodeData = responseData.data
                        completion(.success(decodeData))    // 함수의 .success 결과로 반환
                    } //: do
                    catch let error{    // 디코딩 실패 경우는 catch로 받습니다.
                        print("Error : \(error)")
                        completion(.failure(.requestMapping("디코딩오류")))  // 함수의 .failure 결과로 반환
                    } //: catch
                }
                // Status Code가 300~500인 경우
                else{
                    // response의 metadata를 출력합니다.
                    if let json = try? response.mapJSON() as? [String:Any] {
                        if let errorMSG = json["error"] as? String {
                            print("Error message : \(errorMSG)")
                        }
                    }
                    else {
                        let stringData = try? response.mapString()
                        print("response가 JSON 파일이 아닙니다")
                        print("String : \(stringData)")
                    }
                    completion(.failure(.statusCode(response))) // 함수의 .failure 결과로 반환
                }//: else
                
            // 서버와 통신 실패한 케이스
            // --- case .failure의 본 내용입니다.
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
//    func requestSuccessResWithoutBaseModel<Model : Codable>(target : Provider, instance : Model.Type , completion : @escaping(Model, MoyaError) -> () ){
//        self.request(target) { result in
//            //result는 request결과에 따라 .success와 .failure로 분리됩니다.
//            switch result {
//
//            // 서버와 통신 성공한 케이스
//            case .success(let response):
//                print(response.statusCode)
//
//                // --- case .success의 본 내용입니다.
//                // Status Code가 200번대인 경우
//                if (200..<300).contains(response.statusCode) {
//                    do {
//                        //서버에서 공통으로 제공하는 데이터를 Response로 디코딩하고, 내부 데이터는 Model로 받습니다.
//                        let responseData = try JSONDecoder().decode(Model.self, from: response.data)
//                        //print(responseData)
//
//                        // 디코딩된 내부 데이터의 결과값만 전달합니다
//                        let decodeData = responseData
//                        completion(.success(decodeData))    // 함수의 .success 결과로 반환
//                    } //: do
//                    catch let error{    // 디코딩 실패 경우는 catch로 받습니다.
//                        print("Error : \(error)")
//                        completion(.failure(.requestMapping("디코딩오류")))  // 함수의 .failure 결과로 반환
//                    } //: catch
//                }
//                // Status Code가 300~500인 경우
//                else{
//                    // response의 metadata를 출력합니다.
//                    if let json = try? response.mapJSON() as? [String:Any] {
//                        if let errorMSG = json["error"] as? String {
//                            print("Error message : \(errorMSG)")
//                        }
//                    }
//                    else {
//                        let stringData = try? response.mapString()
//                        print("response가 JSON 파일이 아닙니다")
//                        print("String : \(stringData)")
//                    }
//                    completion(.failure(.statusCode(response))) // 함수의 .failure 결과로 반환
//                }//: else
//
//            // 서버와 통신 실패한 케이스
//            // --- case .failure의 본 내용입니다.
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
    
}

/// 아마도 안쓸듯합니다!
//class CustomPlugIn : PluginType {
//    //request 시작할 때
//    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
//        print("URL Request - \(target) : \(request.url?.absoluteString ?? "없음")")
//        return request
//    }
//
//    //request 끝날 때
//    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError>{
//        print("URL Response - \(target) : \(result)")
//        return result
//    }
//}

/// TokenPlugin은 Moya의 PluginType을 구현한 클래스입니다.
/// 서버 통신에 필요한 Token을 endPorintClosure에서 헤더에 담습니다.
/// 본 서버는 Cookie에 JWT내용을 담고 있습니다..
class TokenPlugin: PluginType {
    let token: String
    
    init(token: String?) {
        if let token = token {
            self.token = token
        }
        else {
            self.token = "noValue"
        }
    }
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        // HTTP Header에 토큰 추가
        // "Authorization=Bearer%20\(myInfo.myToken!)"
        request.addValue("Bearer%20\(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
