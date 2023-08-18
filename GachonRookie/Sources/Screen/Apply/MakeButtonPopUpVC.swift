//
//  MakeButtonPopUpVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MakeButtonPopUpVC: UIViewController {

    // MARK: Variables
    
    var popUpView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    var resultLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "파트 생성하기"
    }
    
    var descriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "생성할 파트의 이름을 적어주세요."
        $0.textColor = Gray07
    }
    
    var textField: UITextField = UITextField().then {
        $0.font = Paragraph5
        $0.placeholder = "타입 이름"
    }
    
    var underLineView: UIView = UIView().then {
        $0.backgroundColor = Black
    }
    
    var finishButton: UIButton = UIButton().then {
        $0.setTitle("파트 생성", for: .normal)
        $0.titleLabel?.font = Paragraph1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 12
        $0.backgroundColor = Main01
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    

    // MARK: View
    
    func setUpView() {
        view.backgroundColor = .clear
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(popUpView)
        [
            resultLabel,
            descriptionLabel,
            textField,
            underLineView,
            finishButton
        ].forEach { popUpView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        popUpView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(200)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(10)
            $0.leading.equalTo(resultLabel)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(resultLabel)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(10)
            $0.leading.equalTo(resultLabel)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(0.7)
        }
        
        finishButton.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(15)
            $0.leading.equalTo(resultLabel)
            $0.trailing.equalToSuperview().offset(-30)
        }
    }
    
}

struct MakeButtonPopUpVC_Preview: PreviewProvider {
    static var previews: some View {
        MakeButtonPopUpVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
