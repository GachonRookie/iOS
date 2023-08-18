//
//  ClubAPI.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation
import Moya

enum ClubAPI {
    
    /// 동아리 만들기 POST
    case postMakeClub(clubStruct: send_postMakeClub)
    
    /// 동아리 리포트 POST
    case postMakeReport(reportStruct: send_postMakeReport)
    
    /// 동아리 지원 POST
    case postApply(applyStruct: send_postApply)
    
    /// 동아리 문의등록 메인페이지 GET
    case getRegisterPage
    
    case getRegisterDetailPage(clubId: Int)
    
    /// 메인 동아리 디테일 페이지 GET
    case getMainDetailPage(clubId: Int)
    
}

extension ClubAPI : TargetType {
    var baseURL: URL {
        return URL(string: "https://ljhhosting.com/api/clubs")!
    }
    
    var path: String {
        switch self {
            
        case .postMakeClub :
            return ""
        
        case .postMakeReport:
            return "/report"
            
        case .postApply:
            return "/apply"
            
        case .getRegisterPage:
            return "/register"
            
        case .getRegisterDetailPage:
            return "/register/detail"
            
        case .getMainDetailPage:
            return "/main/detail"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRegisterPage, .getMainDetailPage, .getRegisterDetailPage :
            return .get
        
        case .postApply, .postMakeReport, .postMakeClub :
            return .post
            
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getMainDetailPage(let clubId),.getRegisterDetailPage(let clubId) :
            return .requestParameters(parameters: ["club-id" : clubId], encoding: URLEncoding.default)
            
        case .postApply(let applyStruct) :
            return .requestJSONEncodable(applyStruct)
            
        case .postMakeClub(let clubStruct) :
            return .requestJSONEncodable(clubStruct)
            
        case .postMakeReport(let reportStruct) :
            return .requestJSONEncodable(reportStruct)
            
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
            
        default :
            // 토큰을 헤더에 추가
            if let token = myInfo.myAccessToken {
                let headers = ["Authorization" : "Bearer \(token)"]
                print("토큰삽입")
                return headers
            }
            return .none
        }
        
        return .none
    }
}

