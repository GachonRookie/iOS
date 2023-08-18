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
        $0.backgroundColor = .gray
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
        segmentControl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(300)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        underLine.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(3)
            $0.top.equalTo(segmentControl.snp.bottom)
        }

        selectedLine.snp.makeConstraints {
            $0.width.equalToSuperview().dividedBy(segmentControl.numberOfSegments)
            $0.height.equalTo(3)
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.equalToSuperview().offset(0)
        }

        clubTableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(underLine.snp.bottom)
            $0.bottom.equalToSuperview()
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
            
//             유저 닉네임 검색 결과 테이블 뷰 숨김
//            self.searchResultTableView.isHidden = true
 
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
            
            
            // 해당 내용은 콜렉션뷰 바꾸고, 테이블뷰 보이게
//            self.searchResultTableView.reloadData()
//            self.searchResultTableView.isHidden = false
            
        } else if segmentIndex == 2 {
            
            self.tableViewIndex = 2
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
                self.selectedLine.snp.updateConstraints {
                    $0.leading.equalTo(self.view.frame.width / 3 * 2)
                }
                self.underLine.layoutIfNeeded()
            })
            
        }
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CircleTableViewCell.cellID, for: indexPath) as! CircleTableViewCell
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

