//
//  RecruitTypeCollectionViewCell.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class RecruitTypeCollectionViewCell: UICollectionViewCell {
    
    // MARK: Variables
    
    var cellID = "recruitCTypeCell"
    
    var recrutingTypeButton: colorButton = colorButton(frame: CGRect()).then {
        $0.setColorAndTitle(title: "ALL", titleColor: Black, backgroundColor: .clear, borderColor: Main01.cgColor)
        
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
        self.contentView.addSubview(recrutingTypeButton)
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        recrutingTypeButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    }
    
    
    // MARK: Functions
    
    @objc func didTypeButtonTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("typeButtonTapped"), object: nil)
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct RecruitTypeCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = RecruitTypeCollectionViewCell()
            return cell
        }
        .previewLayout(.sizeThatFits)
        .padding(10)
    }
}
#endif
