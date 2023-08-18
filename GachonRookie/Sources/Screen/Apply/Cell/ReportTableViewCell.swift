//
//  ReportTableViewCell.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class ReportTableViewCell: UITableViewCell {
    
    // MARK: Variables
    
    var cellID = "reportCell"
    
    var nameLabel: UILabel = UILabel().then {
        $0.font = Paragraph4
        $0.text = "닉네임"
    }
    
    var dateLabel: UILabel = UILabel().then {
        $0.text = "2023.08.19"
        $0.font = CaptionText3
        $0.textColor = Gray07
    }
    
    var commentLabel: UILabel = UILabel().then {
        $0.text = "아니 브로콜리도 안먹으면서 이름음 왜 브로콜리 협의회라 지은거에요?? 어이가 없네"
        $0.font = CaptionText2
        $0.numberOfLines = 50
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
            nameLabel,
            dateLabel,
            commentLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        nameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct ReportTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = ReportTableViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
