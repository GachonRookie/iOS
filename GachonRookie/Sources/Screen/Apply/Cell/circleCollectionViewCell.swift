//
//  circleTableViewCell.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/19.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class circleCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "activityCell"
    
    lazy var shadowView: UIView = UIView().then {
        $0.backgroundColor = .white
        
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowOpacity = 2
        $0.layer.shadowRadius = 8
    }
    
    lazy var backView: UIView = UIView().then {
        $0.backgroundColor = .white

        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    lazy var frontImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "image")
        $0.contentMode = .scaleAspectFill
    }
    
    lazy var frontView: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var titleLabel: UILabel = UILabel().then {
        $0.font = Paragraph1
        $0.text = "문예창작단"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    
    // MARK: View
    
    func setUpView() {
        
    }
    
    // MARK: Layout
    
    func setUpLayout() {
        
        self.contentView.addSubview(shadowView)
        self.contentView.addSubview(backView)
        
        [
            //내용
            frontImage,
            frontView,
            titleLabel
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
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        shadowView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        frontImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(frontView.snp.top)
        }
        
        frontView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.3)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(frontView)
            $0.leading.equalTo(frontView).offset(15)
            $0.trailing.equalTo(frontView).offset(-20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchData(data:circleCellData) {
        self.frontImage.image = data.image
        self.titleLabel.text = data.title
    }
}

#if DEBUG

@available(iOS 13.0, *)
struct CircleCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = circleCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 225, height: 195))
            return cell
        }
        .previewLayout(.fixed(width: 225, height: 195))
        //.padding(10)
    }
}
#endif
