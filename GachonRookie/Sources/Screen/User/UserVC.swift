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
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        myClubCollectionView.snp.makeConstraints {
            $0.top.equalTo(myClubLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(680)
        }
    }
}


// MARK: Extension

extension UserVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClubCollectionViewCell().cellID, for: indexPath) as? MyClubCollectionViewCell else { return UICollectionViewCell() }
        
        
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
