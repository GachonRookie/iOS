//
//  circleCellData.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/18.
//

import Foundation
import UIKit

struct circleCellData {
    let image: UIImage
    let title: String
    let status: String
    let partList: [String]
    let tag: String
    let statusTag: String
}

let Dummy_circleCellDataList: [circleCellData] = [
    circleCellData(image: UIImage(named: "umcImage")!, title: "가천대학교 UMC", status: "모집 예정", partList: ["서버", "안드로이드", "iOS"], tag: "연합", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "moonChang")!, title: "문예창작단", status: "모집 중", partList: ["기타", "보컬", "베이스"], tag: "연합", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "takeout")!, title: "테이크아웃", status: "모집 완료", partList: ["로봇", "인공지능", "자율주행"], tag: "교내", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "roaming")!, title: "로밍", status: "모집 중", partList: ["롤", "내전", "게임"], tag: "연합", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "payload")!, title: "페이로드", status: "모집 예정", partList: ["보안", "정보", "정보보안"], tag: "교내", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "elc")!, title: "ELC", status: "모집 중", partList: ["연합", "경제", "대외활동"], tag: "연합", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "enjoy")!, title: "엔조이리스크", status: "모집 완료", partList: ["경제", "임원진", "회원"], tag: "교내", statusTag: "활동 중"),
    circleCellData(image: UIImage(named: "nak")!, title: "낙서둥지", status: "모집 중", partList: ["부원", "임원진", "덕후"], tag: "교내", statusTag: "신규")
]

/// tag에 따른 리스트의 갯수값을 갖고 옵니다.
func getCountFromCircleData(list:[circleCellData], tag:String? = nil, statusTag:String? = nil) -> Int {
    var count = 0
    
    if tag != nil {
        for data in list {
            if data.tag == tag {
                count += 1
            }
        }
        return count
    }
    else if statusTag != nil {
        for data in list {
            if data.statusTag == statusTag {
                count += 1
            }
        }
        return count
    }
    else {
        return 0
    }
}

/// tag에 맞는 cellData 리스트를 반환합니다.
func getListFromCircleData(list:[circleCellData], tag:String? = nil, statusTag:String? = nil) -> [circleCellData] {
    var returnList:[circleCellData] = []
    
    if tag != nil {
        for data in list {
            if data.tag == tag {
                returnList.append(data)
            }
        }
    } else if statusTag != nil {
        for data in list {
            if data.statusTag == statusTag {
                returnList.append(data)
            }
        }
    }

    return returnList
}
