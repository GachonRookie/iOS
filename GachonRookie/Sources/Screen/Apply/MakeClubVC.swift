//
//  MakeClubVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MakeClubVC: UIViewController {

    // MARK: Variables
    
    /// 모집 파트 저장할 string 배열 선언
    var parts = [String]()
    
    var isUnion: Bool = false
    
    var scrollView: UIScrollView = UIScrollView()
    
    var contentView: UIView = UIView()
    
    var navigationView: UIView = UIView().then {
        $0.backgroundColor = White
    }
    
    var navigationLabel: UILabel = UILabel().then {
        $0.font = Title5
        $0.text = "동아리 생성"
    }
    
    var backButton: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.tintColor = Black
    }
    
    var nameLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "동아리명"
    }
    
    var nameDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리의 이름을 작성해주세요."
    }
    
    var nameTextView: UITextField = UITextField().then {
        $0.font = CaptionText1
        $0.placeholder = "북잼"
    }
    
    var nameUnderLineView: UIView = UIView().then {
        $0.backgroundColor = Black
    }
    
    var typeLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "동아리 분류"
    }
    
    var typeDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리의 종류를 선택해주세요."
    }
    
    var schoolButton: UIButton = UIButton().then {
        $0.setTitle("교내", for: .normal)
        $0.setTitleColor(Black, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = Main01.cgColor
        $0.addTarget(self, action: #selector(didSchoolButtonTapped), for: .touchUpInside)
    }
    
    var unionButton: UIButton = UIButton().then {
        $0.setTitle("연합", for: .normal)
        $0.setTitleColor(Black, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 0.7
        $0.layer.borderColor = Main01.cgColor
        $0.addTarget(self, action: #selector(didUnionButtonTapped), for: .touchUpInside)
    }
    
    var partLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "동아리 모집 파트"
    }
    
    var partDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리에서 모집하는 동아리 파트를 작성해주세요.\n파트는 누르면 삭제됩니다.\n모집 파트가 없다면 ALL 태그를 작성해주세요."
        $0.numberOfLines = 3
    }
    
    var partCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 20
        $0.minimumInteritemSpacing = 20
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.register(RecruitTypeCollectionViewCell.self, forCellWithReuseIdentifier: RecruitTypeCollectionViewCell().cellID)
    }
    
    var linkLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "SNS 링크"
    }
    
    var linkDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "지원이 가능한 동아리 링크를 작성해주세요."
    }
    
    var linkTextView: UITextField = UITextField().then {
        $0.font = CaptionText1
        $0.placeholder = "https://www.bookjam.com"
    }
    
    var linkUnderLineView: UIView = UIView().then {
        $0.backgroundColor = Black
    }
    
    var contentLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "레포트 내용 작성"
    }
    
    var contentDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "지원자들에게 표시될 레포트 내용을 작성해주세요."
    }
    
    var contentBackgroundView: UIView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.backgroundColor = Gray01
        $0.layer.borderColor = Gray05.cgColor
        $0.layer.borderWidth = 1
    }
    
    var contentTextView: UITextView = UITextView().then {
        $0.backgroundColor = .clear
    }
    
    var makeButton: UIButton = UIButton().then {
        $0.setTitle("동아리 생성", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.backgroundColor = Main01
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(didMakeButtonTapped), for: .touchUpInside)
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
        view.backgroundColor = White
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            navigationView,
            nameLabel,
            nameDescriptionLabel,
            nameTextView,
            nameUnderLineView,
            typeLabel,
            typeDescriptionLabel,
            schoolButton,
            unionButton,
            partLabel,
            partDescriptionLabel,
            partCollectionView,
            linkLabel,
            linkDescriptionLabel,
            linkTextView,
            linkUnderLineView,
            contentLabel,
            contentDescriptionLabel,
            contentBackgroundView,
            contentTextView,
            makeButton
        ].forEach { contentView.addSubview($0) }
        
        navigationView.addSubview(navigationLabel)
        navigationView.addSubview(backButton)
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        partCollectionView.delegate = self
        partCollectionView.dataSource = self
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
        
        nameDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        
        nameTextView.snp.makeConstraints {
            $0.top.equalTo(nameDescriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-35)
        }
        
        nameUnderLineView.snp.makeConstraints {
            $0.top.equalTo(nameTextView.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(0.7)
        }
        
        typeLabel.snp.makeConstraints {
            $0.top.equalTo(nameUnderLineView.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
        }
        
        typeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(typeLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        
        schoolButton.snp.makeConstraints {
            $0.top.equalTo(typeDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.snp.centerX).offset(-5)
            $0.height.equalTo(50)
        }
        
        unionButton.snp.makeConstraints {
            $0.top.equalTo(typeDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(view.snp.centerX).offset(5)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(50)
        }
        
        partLabel.snp.makeConstraints {
            $0.top.equalTo(schoolButton.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
        }
        
        partDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(partLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        
        partCollectionView.snp.makeConstraints {
            $0.top.equalTo(partDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
        
        linkLabel.snp.makeConstraints {
            $0.top.equalTo(partCollectionView.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
        }
        
        linkDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(linkLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        
        linkTextView.snp.makeConstraints {
            $0.top.equalTo(linkDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(nameLabel)
        }
        
        linkUnderLineView.snp.makeConstraints {
            $0.top.equalTo(linkTextView.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(0.7)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(linkUnderLineView.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
        }
        
        contentDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        
        contentBackgroundView.snp.makeConstraints {
            $0.top.equalTo(contentDescriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(200)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.leading.equalTo(contentBackgroundView).offset(20)
            $0.trailing.equalTo(contentBackgroundView).offset(-20)
            $0.height.equalTo(160)
        }
        
        makeButton.snp.makeConstraints {
            $0.top.equalTo(contentBackgroundView.snp.bottom).offset(30)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    
    // MARK: Notification
    
    func setUpNotification() {
        /// RecruitTypeCollectionViewCell에서 버튼 눌렀을 때 collectionView에서 삭제되도록 함
        NotificationCenter.default.addObserver(self, selector: #selector(deleteButton), name: NSNotification.Name("typeButtonTapped"), object: nil)
    }
    
    
    // MARK: Function
    
    @objc func deleteButton() {
        
    }
    
    @objc func didMakeButtonTapped() {
        // TODO: 데이터 전송
        let clubName = nameTextView.text
        let parts = "ALL"
        let link = linkTextView.text
        let content = contentTextView.text
        var clubType = -1
        
        isUnion == true ? (clubType = 1) : (clubType = 0)
        /// isUnion 상태까지 적어서 보내...지 않아도 될듯
        
        self.dismiss(animated: true)
    }
    
    @objc func didSchoolButtonTapped() {
        schoolButton.backgroundColor = Main01
        schoolButton.setTitleColor(.white, for: .normal)
        unionButton.backgroundColor = .clear
        unionButton.setTitleColor(.black, for: .normal)
        
        isUnion = false
    }
    
    @objc func didUnionButtonTapped() {
        schoolButton.backgroundColor = .clear
        schoolButton.setTitleColor(.black, for: .normal)
        unionButton.backgroundColor = Main01
        unionButton.setTitleColor(.white, for: .normal)
        
        isUnion = true
    }
}


// MARK: Extension

extension MakeClubVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parts.count + 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecruitTypeCollectionViewCell().cellID, for: indexPath) as? RecruitTypeCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == parts.count + 1 {
            cell.recrutingTypeButton.setTitle("추가 +", for: .normal)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 30, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
        if indexPath.row == parts.count {
            let popUpVC = MakeButtonPopUpVC()
            popUpVC.view.backgroundColor = .black.withAlphaComponent(0.5)
            popUpVC.modalTransitionStyle = .crossDissolve
            popUpVC.modalPresentationStyle = .overFullScreen
            
            self.present(popUpVC, animated: true)
        }
    }
    
}

struct MakeClubVC_Preview: PreviewProvider {
    static var previews: some View {
        MakeClubVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
