//
//  UserVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class UserVC: UIViewController {

    // MARK: Variables
    
    lazy var myClubLabel: UILabel = UILabel().then {
        $0.text = "username님이 찜한 동아리예요."
        $0.font = Title3
    }
    
    lazy var myClubTableView: UITableView = UITableView().then {
        $0.backgroundColor = .blue
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
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            myClubLabel,
            myClubTableView
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        myClubLabel.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
    }
    
}

struct UserVC_Preview: PreviewProvider {
    static var previews: some View {
        UserVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
