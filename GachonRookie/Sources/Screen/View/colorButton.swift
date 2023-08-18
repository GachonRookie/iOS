//
//  colorButton.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/18.
//

import Foundation
import UIKit
import SwiftUI

class colorButton: UIButton {
    
    // MARK: Variables
    
    // 내용, 글자색, 버튼 배경색, 테두리색 설정
    func setColorAndTitle(title:String, titleColor:UIColor = .black, backgroundColor:UIColor, borderColor:CGColor = UIColor.white.cgColor) {
        self.setTitleColor(titleColor, for: .normal)
        self.layer.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    

    // MARK: View
    
    func setUpView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1.5
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = Main01
        self.contentEdgeInsets = UIEdgeInsets(top: 4, left: 13, bottom: 4, right: 13)
        self.titleLabel?.font = .systemFont(ofSize: 11)
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
//        [
//
//        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        
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
}

#if DEBUG

@available(iOS 13.0, *)
struct colorButton_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = colorButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
            cell.setColorAndTitle(title: "테스트", backgroundColor: .white, borderColor: Main02.cgColor)
            return cell
        }
        .previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 393, height: 120))
        //.padding(10)
    }
}
#endif
