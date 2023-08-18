//
//  funcList.swift
//  MoyaPractice
//
//  Created by 박민서 on 2023/08/19.
//

import Foundation
import Moya
import UIKit

////raw하게 쓰는 Moya
//func getHabitData() {
//    let provider = MoyaProvider<MemberAPI>()
//    provider.request(.postUserLogin(userToken: "THISISTEST", nickName: "LAAAMP")) {
//        switch $0 {
//            ///여러가지 케이스에 대해서 nil로 반환해버려서 애매함
//        case let .success(response):
//            print(response.description)
//            if let responseData = try? JSONDecoder().decode(data_postUserLogin.self, from: response.data) {
//                // 디코딩된 내부 데이터의 결과값만 전달합니다
//                let decodeData = responseData
//                print(decodeData)
//            } else {
//                let stringData = try? response.mapString()
//                print("response가 JSON 파일이 아닙니다")
//                print("String : \(stringData)")
//            }
//            //print(responseData)
//            
//            
//            
//        case let .failure(error):
//            print(error.localizedDescription)
//        }
//    }
//}


func usingWrapper() {
    let wrapper = MoyaWrapper<MemberAPI>()
    wrapper.requestSuccessRes(target: .postUserLogin(userToken: "THISISTEST", nickName: "LAAAMP"), instance: data_postUserLogin.self)
    { result in
        switch result {
        case .success(let result):
            print(result)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}

//(target: .postCreateHabit(imageData: UIImage(named: "feeling1")!.pngData()!, content: habitCreationContent(category: "CAREER", days: ["FRI"], detail: "string", endDate: "2023-08-15", endTime: "string", followerLimit:  0, habitStatus: "PRIVATE", hashtags: ["string"], startDate: "2023-08-15", startTime: "string", title: "TEST")), instance: data_postCreateHabit.self)

//(target: .patchMyProfileImage(imageData: (UIImage(named: "feeling1")?.pngData())!), instance: data_patchMyProfileImage.self)
