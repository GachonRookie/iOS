//
//  MemberAPI.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation
import Moya

enum MemberAPI {
    
    /// 멤버로그인 POST
    case postUserLogin(userToken:String, nickName:String)
    
    /// 유저 메인페이지 GET
    case getMainPage
    
}

extension MemberAPI : TargetType {
    var baseURL: URL {
        return URL(string: "https://ljhhosting.com/member")!
    }
    
    var path: String {
        switch self {
            
        case .postUserLogin :
            return "/login"
            
        case .getMainPage :
            return "/main"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainPage :
            return .get
        
        case .postUserLogin :
            return .post
            
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .postUserLogin(let userToken, let nickName) :
            
            let params: [String : Any] = [
                "userToken" : userToken,
                "nickName" : nickName
            ]
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .getMainPage :
            // 토큰을 헤더에 추가
            if let token = myInfo.myAccessToken {
                let headers = ["Authorization" : "Bearer \(token)"]
                return headers
            }
        default :
            return .none
        }
        
        return .none
    }
}
