//
//  currentUserInfo.swift
//  MoyaPractice
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation
import Moya

let myInfo = MyInfo.shared

public class MyInfo {
    
    static let shared = MyInfo()
    public init() {
        // 초기화 내용 작성
        //        getMyToken()
        //        print("getMyToken 완료 init 완료")
    }
    
    /// 현재 유저의 access 토큰입니다
    var myAccessToken: String?{
        didSet {
            print("myAccessToken changed : \(myInfo.myAccessToken!)")
        }
    }
    
    /// 현재 유저의 refresh 토큰입니다
    var myRefreshToken: String?{
        didSet {
            print("myRefreshToken changed : \(myInfo.myRefreshToken!)")
        }
    }
    
    var myID: Int? {
        didSet {
            print("myID changed : \(myInfo.myID!)")
        }
    }
    
    var myName: String? {
        didSet {
            print("myName changed : \(myInfo.myName!)")
        }
    }
    
    /// myInfo에 토큰값을 설정하고, UserDefaults에 토큰을 저장합니다.
    func setMyToken(accessToken: String, refreshToken: String) {
        // 쿠키에서 "Authorization=Bearer%20" 제외하고 추출
        let accessToken = accessToken
        let refreshToken = refreshToken
        // 토큰으로 저장
        myInfo.myAccessToken = accessToken
        myInfo.myRefreshToken = refreshToken
        UserDefaults.standard.set(myInfo.myAccessToken, forKey: "myAccessToken")
        UserDefaults.standard.set(myInfo.myRefreshToken, forKey: "myRefreshToken")
    }
    
    /// UserDefaults에서 토큰 값을 가져옵니다.
    func getMyToken() -> Bool {
        if let token = UserDefaults.standard.string(forKey: "myAccessToken") {
            myInfo.myAccessToken = token
            return true
        } else {
            print("error : 저장된 Access 토큰이 없습니다")
            return false
        }
        if let token = UserDefaults.standard.string(forKey: "myRefreshToken") {
            myInfo.myRefreshToken = token
            return true
        } else {
            print("error : 저장된 Refresh 토큰이 없습니다")
            return false
        }
    }
    
    /// 토큰을 초기화 합니다.
    func resetMyToken() {
        myInfo.myAccessToken = nil
        myInfo.myRefreshToken = nil
    }
    
    /// 애플 로그인 후 JWT 토큰 요청하는 함수입니다.
    func postLoginToGetToken(userID: String, nickName: String) {
        let provider = MoyaProvider<MemberAPI>()
        provider.request(.postUserLogin(userToken: userID, nickName: nickName)) {
            switch $0 {
                ///여러가지 케이스에 대해서 nil로 반환해버려서 애매함
            case let .success(response):
                print(response.description)
                if let responseData = try? JSONDecoder().decode(data_postUserLogin.self, from: response.data) {
                    // 디코딩된 내부 데이터의 결과값만 전달합니다
                    let acToken = responseData.accessToken
                    let rfToken = responseData.refreshToken
                    
                    myInfo.setMyToken(accessToken: acToken, refreshToken: rfToken)
                    
                } else {
                    let stringData = try? response.mapString()
                    print("response가 JSON 파일이 아닙니다")
                    print("String : \(stringData)")
                }
                //print(responseData)
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    /// 유저 메인 페이지 요청하는 함수입니다.
    func getMyPageWithToken() {
        
    }
    
}


