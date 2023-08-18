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
    let tag: Int
}

let Dummy_circleCellDataList: [circleCellData] = [
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리는 행복하지 않아요", status: "모집 예정", partList: ["태그1", "태그2", "태그3"], tag: 1),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리2는 밥을 먹어요", status: "모집 중", partList: ["태그1", "태그2", "태그3"], tag: 2),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리3은 뭐하죠", status: "모집 완료", partList: ["태그1", "태그2", "태그3"], tag: 1),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리4를 양파링을 먹어요", status: "모집 중", partList: ["태그1", "태그2", "태그3"], tag: 2),
    circleCellData(image: UIImage(named: "image")!, title: "브코코로리5는 양파쿵야?", status: "모집 예정", partList: ["태그1", "태그2", "태그3"], tag: 1),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리6은 감자", status: "모집 중", partList: ["태그1", "태그2", "태그3"], tag: 2),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리7은 졸리다", status: "모집 완료", partList: ["태그1", "태그2", "태그3"], tag: 1),
    circleCellData(image: UIImage(named: "image")!, title: "브로콜리8은 행복해!", status: "모집 중", partList: ["태그1", "태그2", "태그3"], tag: 2)
]

/// tag에 따른 리스트의 갯수값을 갖고 옵니다.
func getCountFromCircleData(tag:Int) -> Int {
    var count = 0
    
    for data in Dummy_circleCellDataList {
        if data.tag == tag {
            count += 1
        }
    }
    return count
}

/// tag에 맞는 cellData 리스트를 반환합니다.
func getListFromCircleData(tag:Int) -> [circleCellData] {
    var returnList:[circleCellData] = []
    
    for data in Dummy_circleCellDataList {
        if data.tag == tag {
            returnList.append(data)
        }
    }
    
    return returnList
}
