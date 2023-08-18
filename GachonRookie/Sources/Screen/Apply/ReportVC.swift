//
//  ReportVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class ReportVC: UIViewController {

    // MARK: Variables
    
    var numOfReport: Int = 3
    
    var parts = [String]()
    
    var scrollView: UIScrollView = UIScrollView()
    
    var contentView: UIView = UIView()
    
    var navigationView: UIView = UIView().then {
        $0.backgroundColor = White
    }
    
    var navigationLabel: UILabel = UILabel().then {
        $0.font = Title5
        $0.text = "동아리 이름"
    }
    
    var backButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = Black
        $0.addTarget(self, action: #selector(didBackButtonTapped), for: .touchUpInside)
    }
    
    lazy var nameLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "\(numOfReport)개의 레포트"
    }
    
    var tableView: UITableView = UITableView().then {
        $0.register(ReportTableViewCell.self, forCellReuseIdentifier: ReportTableViewCell().cellID)
    }
    
    var commentBackgroundView: UIView = UIView().then {
        $0.backgroundColor = Gray02
    }
    
    var comentView: UIView = UIView().then {
        $0.backgroundColor = White
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 16
    }
    
    var commentTextField: UITextField = UITextField().then {
        $0.font = Paragraph5
        $0.placeholder = "댓글을 입력해주세요"
    }
    
    var sendButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        $0.tintColor = Main01
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
        view.backgroundColor = .white
        
        //my_setKeyboardObserver()
        setKeyboardObserver()
        hideKeyboard()
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            navigationView,
            nameLabel,
            tableView,
            commentBackgroundView
        ].forEach { contentView.addSubview($0) }
        
        navigationView.addSubview(navigationLabel)
        navigationView.addSubview(backButton)
        
        commentBackgroundView.addSubview(comentView)
        commentBackgroundView.addSubview(commentTextField)
        commentBackgroundView.addSubview(sendButton)
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.equalTo(1000)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(70)
        }
        
        navigationLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        commentBackgroundView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        comentView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(40)
        }
        
        commentTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-50)
        }
        
        sendButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-25)
        }
    }
    
//    func my_setKeyboardObserver() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.my_keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(self.my_keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
//    }
//
//    @objc func my_keyboardWillShow(notification: NSNotification) {
//          if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                  let keyboardRectangle = keyboardFrame.cgRectValue
//                  let keyboardHeight = keyboardRectangle.height
//              UIView.animate(withDuration: 1) {
////                  self.view.window?.frame.origin.y -= keyboardHeight
//                  self.commentBackgroundView.frame.origin.y -= keyboardHeight
//              }
//          }
//      }
//
//    @objc func my_keyboardWillHide(notification: NSNotification) {
//        if self.view.window?.frame.origin.y != 0 {
//            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                    let keyboardRectangle = keyboardFrame.cgRectValue
//                    let keyboardHeight = keyboardRectangle.height
//                UIView.animate(withDuration: 1) {
////                    self.view.window?.frame.origin.y += keyboardHeight
//                    self.commentBackgroundView.frame.origin.y += keyboardHeight
//                }
//            }
//        }
//    }
    
    
    // MARK: Extension
    
    @objc func didBackButtonTapped() {
        self.dismiss(animated: true)
    }
}


// MARK: Extension

extension ReportVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfReport
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell().cellID, for: indexPath) as! ReportTableViewCell
        
        
        switch indexPath.row {
        case 0:
            cell.nameLabel.text = "램프"
            cell.commentLabel.text = "UMC 데모데이 관련 안내 사항이 있어 공지드립니다.\n이번 데모데이 티켓은 데모데이 출입증으로 사용됩니다."
            cell.dateLabel.text = "2023.07.23"
        case 1:
            cell.nameLabel.text = "로딩"
            cell.commentLabel.text = "이번에도 마찬가지일 것으로 예상되니 반드시 선착순임을 유의해서 구글폼을 제출해 주세요. 참가한 PM분들은 모두 알고 계시겠지만 혹시 모르니 팀 내에서 한 번씩 확인 부탁드립니다."
            cell.dateLabel.text = "2023.07.28"
        case 2:
            cell.nameLabel.text = "짐깅"
            cell.commentLabel.text = "데모데이에 무조건 참석할 수 있는 것은 아니고, 추후에 중앙에서 날짜별로 신청을 받을 예정입니다."
            cell.dateLabel.text = "2023.08.10"
        default : break
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

struct ReportVC_Preview: PreviewProvider {
    static var previews: some View {
        ReportVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
