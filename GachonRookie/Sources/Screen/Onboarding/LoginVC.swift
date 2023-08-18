//
//  LoginVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import AuthenticationServices
import SwiftUI
import UIKit

import SnapKit
import Then


class LoginVC: UIViewController {

    // MARK: Variables
    
    var logoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "Logo")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    var descriptionLabel: UILabel = UILabel().then {
        $0.text = "동아리의 첫 시작, 동방"
        $0.font = Paragraph2
        $0.textColor = White
    }
    
    var appleLoginButton: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton().then {
        $0.addTarget(self, action: #selector(didAppleButtonTapped), for: .touchUpInside)
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
        view.backgroundColor = Main01
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            logoImageView,
            descriptionLabel,
            appleLoginButton
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(20)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-90)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(50)
        }
    }
    
    
    // MARK: Function
    
}


// MARK: Extension

// 애플 로그인 기능 구현을 위한 ASAuthorizationController Delegate와 ContextProviding extension 구현
extension LoginVC: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    // Apple로 로그인 버튼 누르면 계정 인증되도록 구현
    // appleButton addTarget으로 설정
    @objc func didAppleButtonTapped() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
          let request = appleIDProvider.createRequest()
          request.requestedScopes = [.fullName, .email]
            
          let authorizationController = ASAuthorizationController(authorizationRequests: [request])
          authorizationController.delegate = self
          authorizationController.presentationContextProvider = self
          authorizationController.performRequests()
    } // end of didAppleButtonTapped()
    
    // 애플 인증 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        print("Apple ID Credential Authorization User ID : \(appleIDCredential.user)")
        print("\(appleIDCredential.email)")
        print("\(appleIDCredential.fullName)")
        
        // 일단 화면 전환만 가능하게 설정
        
        // TODO: 서버랑 연결해서 정보 넘기고 메인으로 전환까지 진행
        // 회원이면 로그인 처리하고 메인으로 전환
        // 회원 아니면 온보딩 04로 연결해서 가입 진행
    }
    
    // 애플 인증 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID Credential failed with error : \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

struct LoginVC_Preview: PreviewProvider {
    static var previews: some View {
        LoginVC().toPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
