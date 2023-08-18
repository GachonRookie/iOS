//
//  MyClubCollectionViewCell.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MyClubCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    var cellID = "myClubCell"
    
    var shadowView: UIView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowOpacity = 2
        $0.layer.shadowRadius = 14
    }
    
    var backView: UIView = UIView().then {
        $0.backgroundColor = .white

        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    var clubImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "image")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    var clubTypeLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "교내 동아리"
    }
    
    var resultEnrollButton: UIButton = UIButton().then {
        $0.setTitle("나의 심사 결과 등록하기 >", for: .normal)
        $0.setTitleColor(Gray07, for: .normal)
        $0.titleLabel?.font = CaptionText4
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = Gray07.cgColor
        $0.addTarget(self, action: #selector(didResultEnrollButtonTapped), for: .touchUpInside)
    }
    
    var clubNameLabel: UILabel = UILabel().then {
        $0.font = Title2
        $0.text = "clubname"
    }
    
    var recrutingTypeButton: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "iOS", titleColor: Black, backgroundColor: .clear, borderColor: Main01.cgColor)
        
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        self.contentView.addSubview(shadowView)
        self.contentView.addSubview(backView)
        
        [
            clubImageView,
            clubTypeLabel,
            resultEnrollButton,
            clubNameLabel,
            recrutingTypeButton,
            clubRecruitingLabel,
            clubRecruitngDateLabel,
            currentApplyLabel,
            currentApplyNumberLabel,
            previousApplyLabel,
            previousApplyPercentLabel
        ].forEach { backView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
        backView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(550)
        }
        
        shadowView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(530)
        }
        
        clubImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        clubTypeLabel.snp.makeConstraints {
            $0.top.equalTo(clubImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        resultEnrollButton.snp.makeConstraints {
            $0.centerY.equalTo(clubTypeLabel)
            $0.leading.equalTo(clubTypeLabel.snp.trailing).offset(10)
            $0.width.equalTo(120)
            $0.height.equalTo(22)
        }
        
        clubNameLabel.snp.makeConstraints {
            $0.top.equalTo(clubTypeLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        recrutingTypeButton.snp.makeConstraints {
            $0.centerY.equalTo(clubNameLabel)
            $0.leading.equalTo(clubNameLabel.snp.trailing).offset(10)
        }
        
        clubRecruitingLabel.snp.makeConstraints {
            $0.top.equalTo(clubNameLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        clubRecruitngDateLabel.snp.makeConstraints {
            $0.top.equalTo(clubRecruitingLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        currentApplyLabel.snp.makeConstraints {
            $0.top.equalTo(clubRecruitngDateLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        currentApplyNumberLabel.snp.makeConstraints {
            $0.top.equalTo(currentApplyLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        previousApplyLabel.snp.makeConstraints {
            $0.top.equalTo(currentApplyNumberLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        previousApplyPercentLabel.snp.makeConstraints {
            $0.top.equalTo(previousApplyLabel.snp.bottom).offset(20)
            $0.leading.equalTo(clubTypeLabel)
        }
    }
    
    
    // MARK: Functions
    
    @objc func didResultEnrollButtonTapped() {
        print("등록 버튼 클릭됨")
        
        /// 심사 결과 등록하기 버튼 눌렀을 때 팝업 버튼 띄우기 위해 UserVC에 알림 전송
        NotificationCenter.default.post(name: NSNotification.Name("resultButtonTapped"), object: nil)
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct MyClubCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = MyClubCollectionViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
