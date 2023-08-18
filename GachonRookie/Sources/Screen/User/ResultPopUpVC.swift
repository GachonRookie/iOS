//
//  ResultPopUpVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class ResultPopUpVC: UIViewController {

    // MARK: Variables
    
    var popUpView: UIView = UIView().then {
        $0.backgroundColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
    }
    
    var resultLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "동아리 심사가 끝났나요?\n심사 결과를 등록해주세요."
        $0.numberOfLines = 2
    }
    
    var descriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "username님의 심사 결과 데이터는\n앞으로 더 나은 앱을 만들기 위해 사용됩니다.\n더 나은 동방을 만들기 위해 참여해주셔서 감사합니다 :)"
        $0.numberOfLines = 3
    }
    
    var acceptButton: UIButton = UIButton().then {
        $0.setTitle("합격했어요", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.backgroundColor = Main01
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(didAcceptButtonTapped), for: .touchUpInside)
    }
    
    var unacceptButton: UIButton = UIButton().then {
        $0.setTitle("불합격했어요", for: .normal)
        $0.setTitleColor(Gray07, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = Gray07.cgColor
        $0.layer.borderWidth = 1
        $0.addTarget(self, action: #selector(didUnacceptButtonTapped), for: .touchUpInside)
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
        
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(popUpView)
        [
            resultLabel,
            descriptionLabel,
            acceptButton,
            unacceptButton
        ].forEach { popUpView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        popUpView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(300)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(30)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(10)
            $0.leading.equalTo(resultLabel)
        }
        
        acceptButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(45)
        }
        
        unacceptButton.snp.makeConstraints {
            $0.top.equalTo(acceptButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(45)
        }
    }
    
    
    // MARK: Function
    
    @objc func didAcceptButtonTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("acceptButtonTapped"), object: nil)
        
        self.dismiss(animated: true)
    }
    
    @objc func didUnacceptButtonTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("unacceptButtonTapped"), object: nil)
        
        self.dismiss(animated: true)
    }
}

struct ResultPopUpVC_Preview: PreviewProvider {
    static var previews: some View {
        ResultPopUpVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
