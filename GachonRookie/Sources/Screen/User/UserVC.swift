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
    
    var isUnion: Int = 0
    var userName: String = "유진"
    var clubName: String = "브로콜리협의회"
    var recruitStartDate: String = "2023-08-20"
    var recruitEndDate: String = "2023-08-26"
    var typeName: String = "iOS"
    var numOfRecruit: Int = 33
    var numOflastApply: Int = 66
    var numOfLastPass: Int = 28
    
    let dateFormat: DateFormatter = DateFormatter().then {
        $0.dateFormat = "yyyy-MM-dd"
    }
    
    lazy var convertRecruitStartDate = Calendar.current.dateComponents([.year, .month, .day], from: dateFormat.date(from: recruitStartDate)!)
    
    lazy var convertRecruitEndDate = Calendar.current.dateComponents([.year, .month, .day], from: dateFormat.date(from: recruitEndDate)!)
    
    lazy var myClubLabel: UILabel = UILabel().then {
        $0.text = "\(userName)님이 찜한 동아리예요."
        $0.font = Title3
    }
    
    lazy var myClubCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 20
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.register(MyClubCollectionViewCell.self, forCellWithReuseIdentifier: MyClubCollectionViewCell().cellID)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
        setUpNotification()
    }
    

    // MARK: View
    
    func setUpView() {
        view.backgroundColor = .white
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        [
            myClubLabel,
            myClubCollectionView
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        myClubCollectionView.dataSource = self
        myClubCollectionView.delegate = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        myClubLabel.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        myClubCollectionView.snp.makeConstraints {
            $0.top.equalTo(myClubLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    
    // MARK: Notification
    
    func setUpNotification() {
        /// 카드 셀에서 심사 결과 등록하기 버튼 눌렀을 때 받는 notification
        NotificationCenter.default.addObserver(self, selector: #selector(didResultButtonTapped), name: NSNotification.Name("resultButtonTapped"), object: nil)
    }
    
    
    // MARK: Function
    
    @objc func didResultButtonTapped() {
        let popUpVC = ResultPopUpVC()
        popUpVC.view.backgroundColor = .black.withAlphaComponent(0.5)
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.modalPresentationStyle = .overFullScreen
        
        self.present(popUpVC, animated: true)
    }
}


// MARK: Extension

extension UserVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClubCollectionViewCell().cellID, for: indexPath) as? MyClubCollectionViewCell else { return UICollectionViewCell() }
        
        cell.clubNameLabel.text = clubName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}

struct UserVC_Preview: PreviewProvider {
    static var previews: some View {
        UserVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
