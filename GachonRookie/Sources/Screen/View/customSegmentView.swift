//
//  customSegmentView.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/18.
//

import UIKit


/// 검색 테이블을 스위칭할 세그먼트 컨트롤입니다.
/// ! 선언 시에 세그먼트 아이템들을 등록해줘야 합니다!
class CustomSegmentControl: UISegmentedControl {
    
    //세그먼트의 디폴트 높이입니다.
    static let selfHeight = 50.0
    
    /// 세그먼트 아이템 등록 함수
    /// String 배열로 받습니다.
    func addItems(_ items: [String]) {
        for (index, item) in items.enumerated() {
                insertSegment(withTitle: item, at: index, animated: false)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.selectedSegmentTintColor = .clear
        
        // 배경 색 제거
        self.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        //self.backgroundColor = .systemGray6
    
        // Segment 구분 라인 제거
        self.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        // Segment 요소 추가
//        self.insertSegment(withTitle: "습관 찾기", at: 0, animated: true)
//        self.insertSegment(withTitle: "유저 닉네임", at: 1, animated: true)
        
        // 디폴트로 선택된 segment
        self.selectedSegmentIndex = 0
        
        // 선택 되어 있지 않을때 폰트 및 폰트컬러
        self.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ], for: .normal)
        
        // 선택 안했을 때 배경색
        //self.setBackgroundColor(.blue, for: .normal)
        
        
        // 선택 되었을때 폰트 및 폰트컬러
        self.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)
        ], for: .selected)
        
        // 선택 했을 때 배경색
        //self.setBackgroundColor(.systemGray, for: .selected)
        
        //self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
