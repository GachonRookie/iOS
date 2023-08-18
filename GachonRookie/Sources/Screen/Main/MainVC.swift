//
//  MainVC.swift
//  GachonRookie
//
//  Created by 박민서 on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class MainVC: UIViewController {
    
    /// TableView 내용 전환을 위한 Index 변수입니다.
    /// segmentControl에 의해 변경됩니다.
    private var tableViewIndex: Int = 0
    
    /// 닉네임 받아오기
    var nickName: String = "유짐asdf"
    var frontImage: UIImage = UIImage(named: "image")!
    var circleName: String = "문예창작단"
    
    
    // 뒷 회색뷰
    lazy var grayView = UIView().then {
        $0.backgroundColor = Gray02
    }
    
    // 안녕하셍ㅅ 유짐님!
    lazy var titleLabel:UILabel = UILabel().then {
        let inputStr = "안녕하세요, \(nickName)님!"
        
        let attributedText = NSMutableAttributedString(string: inputStr)
        attributedText.addAttribute(.font, value: Title3, range: NSRange(location: 0, length: inputStr.count))
        attributedText.addAttribute(.foregroundColor, value: Main01, range: NSRange(location: 7, length: nickName.count))
        
        $0.attributedText = attributedText
    }
    
    //그림자
    lazy var shadowView:UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        // 그림자를 넣을 UIView의 layer를 가져옴
        $0.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        $0.layer.shadowOpacity = 0.5 // 그림자 투명도
        $0.layer.shadowOffset = CGSize(width: 0, height: 5) // 그림자 위치
        $0.layer.shadowRadius = 5 // 그림자의 블러 반경
    }
    
    // 대문 뷰
    lazy var frontView:UIView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    // 대문 이미지 뷰
    lazy var frontImageView:UIImageView = UIImageView().then {
        $0.image = frontImage
        $0.contentMode = .scaleAspectFill
    }
    
    // "이번주에는 \(동아리 이름)"
    lazy var frontTopLabel: UILabel = UILabel().then {
        $0.text = "이번 주에는\n\(circleName)"
        $0.numberOfLines = 2
//        $0.font = .systemFont(ofSize: 20, weight: .bold)
        let inputStr = "이번 주에는\n\(circleName)"
        
        let attributedText = NSMutableAttributedString(string: inputStr)
        attributedText.addAttribute(.font, value: Title3, range: NSRange(location: 0, length: inputStr.count))
        attributedText.addAttribute(.foregroundColor, value: Main01, range: NSRange(location: 7, length: inputStr.count-7))
        
        $0.attributedText = attributedText
    }
    
    lazy var frontSecondLabel: UILabel = UILabel().then {
        $0.font = CaptionText4
        $0.numberOfLines = 0
        let attributedText = NSMutableAttributedString(string: "에서 신입부원을 모집중 이에요!")
        attributedText.addAttribute(.foregroundColor, value: Main01, range: NSRange(location: 2, length: 10))
        attributedText.addAttribute(.font, value: CaptionText1, range: NSRange(location: 2, length: 10))
        
        $0.attributedText = attributedText
    }
    
    lazy var frontThirdLabel: UILabel = UILabel().then {
        $0.font = CaptionText4
        $0.numberOfLines = 0
        $0.text = "\(circleName)\n페이지 바로가기 >"
        $0.textColor = Gray08
    }
    
    // 네비게이션 바 아래 세그먼트 컨트롤
    lazy var segmentControl = CustomSegmentControl(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: CustomSegmentControl.selfHeight)).then {
        //MARK: - segmentControl action추가 - tableView 내용 변경
        $0.addTarget(self, action: #selector(changeTableViewContent), for: .valueChanged)
        // MARK: - 기본 설정 인덱스 0
        $0.selectedSegmentIndex = 0
        $0.addItems(["전체", "교내", "연합"])
    }
    
    // 세그먼트 컨트롤 밑선
    lazy var underLine = UIView().then {
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    // 세그먼트 컨트롤 강조선
    lazy var selectedLine = UIView().then {
        $0.backgroundColor = Main01
    }
    
    // 세그먼트 아래 tableView
    lazy var clubTableView = UITableView().then {
        $0.backgroundColor = .white
        $0.separatorInset.left = 15
        $0.separatorInset.right = 15
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.view.frame.width)
        
        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    

    // MARK: View
    func setUpView() {
        view.backgroundColor = .white
        
        //MARK: - tableViewCell 파일 register
        self.clubTableView.register(CircleTableViewCell.self, forCellReuseIdentifier: CircleTableViewCell.cellID)
    }
    
    
    // MARK: Layout
    func setUpLayout() {
        
        [
            frontImageView,
            frontTopLabel,
            frontSecondLabel,
            frontThirdLabel
        ].forEach {frontView.addSubview($0)}
        
        
        [
            grayView,
            titleLabel,
            shadowView,
            frontView,
            segmentControl,
            underLine,
            selectedLine,
            clubTableView
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    func setUpDelegate() {
        self.clubTableView.delegate = self
        self.clubTableView.dataSource = self
    }
    
    
    // MARK: Constraint
    func setUpConstraint() {
        
        grayView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(segmentControl.snp.top)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(grayView).offset(20)
            $0.leading.equalToSuperview().offset(30)
        }
        
        shadowView.snp.makeConstraints {
            $0.edges.equalTo(frontView)
        }
        
        frontImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(140)
        }
        
        frontTopLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(frontView.snp.centerX).offset(0)
        }
        
        frontSecondLabel.snp.makeConstraints {
            $0.top.equalTo(frontTopLabel.snp.bottom).offset(5)
            $0.leading.equalTo(frontTopLabel)
        }
        
        frontThirdLabel.snp.makeConstraints {
            $0.top.equalTo(frontSecondLabel.snp.bottom).offset(20)
            $0.leading.equalTo(frontSecondLabel)
        }
        
        frontView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.centerX.equalToSuperview()
//            $0.bottom.equalTo(grayView).offset(-40)
            $0.height.equalTo(160)
        }
        
        
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(frontView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        underLine.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(segmentControl.snp.bottom)
        }

        selectedLine.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(segmentControl.numberOfSegments)
            $0.height.equalTo(1)
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.equalToSuperview().offset(0)
        }

        clubTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(underLine.snp.bottom)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    /// TableView 내용 변경
    /// sementIndex를 불러와 tableView 표시내용의 종류를 결정합니다.
    @objc func changeTableViewContent() {
        let segmentIndex = CGFloat(self.segmentControl.selectedSegmentIndex)
        if segmentIndex == 0 {
            
            self.tableViewIndex = 0
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                
                // 밑 강조선 이동
                self.selectedLine.snp.updateConstraints {
                    $0.leading.equalTo(0)
                }
                
                // 레이아웃 업데이트
                self.underLine.layoutIfNeeded()
            })
            
            // 테이블 뷰 업데이트
            self.clubTableView.reloadData()
 
        } else if segmentIndex == 1 {
            
            self.tableViewIndex = 1
//
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
//
                self.selectedLine.snp.updateConstraints {
                    $0.leading.equalTo(self.view.frame.width / 3)
                }
                
                self.underLine.layoutIfNeeded()
            })
            
            // 테이블 뷰 업데이트
            self.clubTableView.reloadData()
            
            
            // 해당 내용은 콜렉션뷰 바꾸고, 테이블뷰 보이게
//            self.searchResultTableView.reloadData()
//            self.searchResultTableView.isHidden = false
            
        } else if segmentIndex == 2 {
            
            self.tableViewIndex = 2
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.selectedLine.snp.updateConstraints {
                    $0.leading.equalTo(self.view.frame.width / 3 * 2)
                }
                
                // 테이블 뷰 업데이트
                self.clubTableView.reloadData()
                
                self.underLine.layoutIfNeeded()
            })
            
        }
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch self.tableViewIndex {
            //전체
        case 0:
            return Dummy_circleCellDataList.count
            //교내
        case 1:
            return getCountFromCircleData(tag: 1)
            //연합
        case 2:
            return getCountFromCircleData(tag: 2)
            
        default:
            return getCountFromCircleData(tag: self.tableViewIndex)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CircleTableViewCell.cellID, for: indexPath) as! CircleTableViewCell
        
        switch self.tableViewIndex {
        case 0:
            cell.fetchData(data: Dummy_circleCellDataList[indexPath.row])
        case 1:
            cell.fetchData(data:getListFromCircleData(tag: 1)[indexPath.row])
        case 2:
            cell.fetchData(data:getListFromCircleData(tag: 2)[indexPath.row])
            
        default:
            cell.fetchData(data: Dummy_circleCellDataList[indexPath.row])
        }
        
//        cell.fetchData(data: Dummy_circleCellDataList[indexPath.row])
        // 셀 선택할 때의 색 없앱니다
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(MainDetailVC(), animated: true)
    }
}


struct MainVC_Preview: PreviewProvider {
    static var previews: some View {
        MainVC().toPreview()
             .edgesIgnoringSafeArea(.all)
    }
}

