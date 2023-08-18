//
//  cirtcleTableViewCell.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/18.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class CircleTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    static let cellID = "activityCell"
    
    lazy var clubImageView:UIImageView = UIImageView().then {
        $0.image = UIImage(named: "image")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
    }
    
    lazy var titleLabel:UILabel = UILabel().then {
        $0.text = "가천대학교 브로콜리 협의회"
        $0.font = .systemFont(ofSize: 17, weight: .medium)
        $0.textColor = .black
    }
    
    lazy var statusButton: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "모집 예정", titleColor: .white, backgroundColor: Main04)
        $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
        $0.titleLabel?.font = .systemFont(ofSize: 13)
        $0.layer.cornerRadius = 15
    }
    
    lazy var partButton1: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "몰라", titleColor: .black, backgroundColor: White, borderColor: Main01.cgColor)
        $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 13, bottom: 4, right: 13)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
    }
    
    lazy var partButton2: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "ios", titleColor: .black, backgroundColor: White, borderColor: Main01.cgColor)
        $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 13, bottom: 4, right: 13)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
    }
    
    lazy var partButton3: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "취미", titleColor: .black, backgroundColor: White, borderColor: Main01.cgColor)
        $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 13, bottom: 4, right: 13)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
    }
    
    lazy var dotsBtn: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        $0.tintColor = .gray
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
            titleLabel,
            statusButton,
            partButton1,
            partButton2,
            partButton3,
            dotsBtn
        ].forEach{ self.contentView.addSubview($0) }
        
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    override func prepareForReuse() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
        clubImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(90)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(clubImageView.snp.trailing).offset(20)
            $0.top.equalTo(clubImageView)
        }
        
        statusButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel)
            $0.height.equalTo(30)
        }
        
        partButton1.snp.makeConstraints {
            $0.top.equalTo(statusButton.snp.bottom).offset(5)
            $0.leading.equalTo(statusButton).offset(2)
            $0.height.equalTo(25)
        }
        
        partButton2.snp.makeConstraints {
            $0.leading.equalTo(partButton1.snp.trailing).offset(5)
            $0.centerY.equalTo(partButton1)
            $0.height.equalTo(25)
        }
        
        partButton3.snp.makeConstraints {
            $0.leading.equalTo(partButton2.snp.trailing).offset(5)
            $0.centerY.equalTo(partButton2)
            $0.height.equalTo(25)
        }
        
        dotsBtn.snp.makeConstraints {
            $0.leading.equalTo(partButton3.snp.trailing).offset(5)
            $0.centerY.equalTo(partButton3)
            $0.height.equalTo(25)
        }
        
    }
    
    func fetchData(data:circleCellData) {
        self.clubImageView.image = data.image
        self.titleLabel.text = data.title
        self.statusButton.setTitle(data.status, for: .normal)
        changeStatusBtnbyStatus(data.status)
        self.partButton1.titleLabel?.text = data.partList[0]
        self.partButton2.titleLabel?.text = data.partList[1]
        self.partButton3.titleLabel?.text = data.partList[2]
        
    }
    
    func changeStatusBtnbyStatus(_ status:String) {
        switch status {
        case "모집 예정":
            statusButton.backgroundColor = Warning
        case "모집 중":
            statusButton.backgroundColor = Complete
        case "모집 완료":
            statusButton.backgroundColor = .gray.withAlphaComponent(0.5)
            statusButton.setTitleColor(.black, for: .normal)
        default:
            return
        }
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct CircleTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = CircleTableViewCell(style: .default, reuseIdentifier: CircleTableViewCell.cellID)
            return cell
        }
        .previewLayout(.fixed(width: 393, height: 120))
        //.padding(10)
    }
}
#endif
