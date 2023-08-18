//
//  MyClubTableViewCell.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MyClubTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    var cellID = "myClubCell"
    
    var clubImageView: UIImageView = UIImageView().then {
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    var clubTypeLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "교내 동아리"
    }
    
    var clubNameLabel: UILabel = UILabel().then {
        $0.font = Title2
        $0.text = "clubname"
    }
    
    var clubRecruitingLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "모집 기간"
    }
    
    var clubRecruitngDateLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "m월 dd일부터 m월 dd일까지"
    }
    
    var currentApplyLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "모집 현황"
    }
    
    var currentApplyNumberLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "지금 nn명이 clubname에 지원했어요!"
    }
    
    var previousApplyLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "직전 기수 합격률"
    }
    
    var previousApplyPercentLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "직전 기수에서는 nn명 중 mm명이 합격했어요!"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            clubImageView,
            clubTypeLabel,
            clubNameLabel,
            clubRecruitingLabel,
            clubRecruitngDateLabel,
            currentApplyLabel,
            currentApplyNumberLabel,
            previousApplyLabel,
            previousApplyPercentLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        clubImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(280)
        }
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct MyClubTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = MyClubTableViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
