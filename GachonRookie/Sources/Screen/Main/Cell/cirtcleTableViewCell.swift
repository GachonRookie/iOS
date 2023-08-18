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
    
    lazy var clubImageView:UIImageView = UIImageView().then {
        $0.image = UIImage(named: "image")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
    }
    
    lazy var titleLabel:UILabel = UILabel().then {
        $0.text = "가천대학교 브로콜리 협의회"
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
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
    
    
    
    // MARK: Variables
    
    static let cellID = "activityCell"
    
    // MARK: View
    
    func setUpView() {
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        
        [
            clubImageView,
            titleLabel
        ].forEach{ self.contentView.addSubview($0) }
        
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
        clubImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
//            $0.center.equalToSuperview()
//            $0.size.equalTo(self.)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
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
        .previewLayout(.sizeThatFits)
        //.padding(10)
    }
}
#endif
