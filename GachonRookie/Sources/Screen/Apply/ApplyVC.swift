//
//  ApplyVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//


import SwiftUI
import UIKit

import SnapKit
import Then


class ApplyVC: UIViewController, UIScrollViewDelegate {

    // MARK: Variables
    /// segmentControl에 의해 변경됩니다.
    private var tableViewIndex: Int = 0
    
    
    // 네비게이션 바 아래 세그먼트 컨트롤
    lazy var segmentControl = CustomSegmentControl(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: CustomSegmentControl.selfHeight)).then {
        //MARK: - segmentControl action추가 - tableView 내용 변경
        $0.addTarget(self, action: #selector(changeTableViewContent), for: .valueChanged)
        // MARK: - 기본 설정 인덱스 0
        $0.selectedSegmentIndex = 0
        $0.addItems(["교내", "연합"])
    }
    
    // 세그먼트 컨트롤 밑선
    lazy var underLine = UIView().then {
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    // 세그먼트 컨트롤 강조선
    lazy var selectedLine = UIView().then {
        $0.backgroundColor = Main01
    }
    
    lazy var mainScrollView: UIScrollView = UIScrollView()
    
    lazy var contentView = UIView()
    
    // 활동중 라벨
    lazy var onActiveLabel: UILabel = UILabel().then {
        $0.text = "활동 중"
        $0.font = Title3
    }
    
    // 활동중 컬렉션 뷰
    lazy var onActiveCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.register(circleCollectionViewCell.self, forCellWithReuseIdentifier: circleCollectionViewCell.cellID)
        //$0.backgroundColor = .gray
        $0.tag = 0
    }
    
    // 활동중 아래선
    lazy var firstLine = UIView().then { $0.backgroundColor = Gray04 }
    
    // 폐지 라벨
    lazy var closedLabel: UILabel = UILabel().then {
        $0.text = "폐지"
        $0.font = Title3
    }
    
    // 폐지 컬렉션 뷰
    lazy var closedCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.register(circleCollectionViewCell.self, forCellWithReuseIdentifier: circleCollectionViewCell.cellID)
        //$0.backgroundColor = .gray
        $0.tag = 1
    }
    
    // 폐지 아래선
    lazy var secondLine = UIView().then { $0.backgroundColor = Gray04 }
    
    // 신규 라벨
    lazy var newLabel: UILabel = UILabel().then {
        $0.text = "신규"
        $0.font = Title3
    }
    
    lazy var makeNewBtn: UIButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus.circle")!, for: .normal)
        $0.tintColor = Main01
        $0.addTarget(self, action: #selector(presentView), for: .touchUpInside)
    }
    
    // 신규 컬렉션 뷰
    lazy var newCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    }).then {
        $0.showsHorizontalScrollIndicator = false
        $0.register(circleCollectionViewCell.self, forCellWithReuseIdentifier: circleCollectionViewCell.cellID)
        //$0.backgroundColor = .gray
        $0.tag = 2
    }
    
    // 신규 아래선
    lazy var thirdLine = UIView().then { $0.backgroundColor = Gray04 }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
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
        self.view.backgroundColor = .white
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        
        [
            onActiveLabel,
            onActiveCollectionView,
            firstLine,
            closedLabel,
            closedCollectionView,
            secondLine,
            newLabel,
            makeNewBtn,
            newCollectionView,
            thirdLine
        ].forEach { contentView.addSubview($0)}
        
        
        
        mainScrollView.addSubview(contentView)
        [
            segmentControl,
            underLine,
            selectedLine,
            mainScrollView
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        mainScrollView.delegate = self
        onActiveCollectionView.delegate = self
        onActiveCollectionView.dataSource = self
        closedCollectionView.delegate = self
        closedCollectionView.dataSource = self
        newCollectionView.delegate = self
        newCollectionView.dataSource = self
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
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
        
        mainScrollView.snp.makeConstraints {
            $0.top.equalTo(underLine.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(mainScrollView.contentLayoutGuide)
            $0.width.equalTo(mainScrollView.frameLayoutGuide)
            $0.height.equalTo(900)
        }
        
        onActiveLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(20)
        }
        
        onActiveCollectionView.snp.makeConstraints {
            $0.top.equalTo(onActiveLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        firstLine.snp.makeConstraints {
            $0.top.equalTo(onActiveCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        closedLabel.snp.makeConstraints {
            $0.top.equalTo(firstLine.snp.bottom).offset(30)
            $0.leading.equalTo(onActiveLabel)
        }
        
        closedCollectionView.snp.makeConstraints {
            $0.top.equalTo(closedLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        secondLine.snp.makeConstraints {
            $0.top.equalTo(closedCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        newLabel.snp.makeConstraints {
            $0.top.equalTo(secondLine.snp.bottom).offset(30)
            $0.leading.equalTo(onActiveLabel)
        }
        
        makeNewBtn.snp.makeConstraints {
            $0.leading.equalTo(newLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(newLabel)
            $0.size.equalTo(20)
        }
        
        newCollectionView.snp.makeConstraints {
            $0.top.equalTo(newLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        
    }
    
    @objc func presentView() {
//        let nextVC = 당신의 VC
//        self.navigationController?.pushViewController(nextVC, animated: true)
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
            self.onActiveCollectionView.reloadData()
            self.closedCollectionView.reloadData()
            self.newCollectionView.reloadData()

        } else if segmentIndex == 1 {

            self.tableViewIndex = 1
//
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
//
                self.selectedLine.snp.updateConstraints {
                    $0.leading.equalTo(self.view.frame.width / 2)
                }

                self.underLine.layoutIfNeeded()
            })

            // 테이블 뷰 업데이트
            self.onActiveCollectionView.reloadData()
            self.closedCollectionView.reloadData()
            self.newCollectionView.reloadData()

        }
    }
    
    
}

extension ApplyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let index = self.tableViewIndex + 1
    
        switch index {
            
        case 1:
            
            let case1_list = getListFromCircleData(list: Dummy_circleCellDataList, tag: "교내")
            
            switch collectionView.tag {
                
            case 0:
                print(getCountFromCircleData(list: case1_list, statusTag: "활동 중"))
                return getCountFromCircleData(list: case1_list, statusTag: "활동 중")
                
            case 1:
                return getCountFromCircleData(list: case1_list, statusTag: "폐지")
                
            case 2:
                return getCountFromCircleData(list: case1_list, statusTag: "신규")
                
            default:
                return 0
            }
            
            //연합
        case 2:
            let case2_list = getListFromCircleData(list: Dummy_circleCellDataList, tag: "연합")
            
            switch collectionView.tag {
                
            case 0:
                return getCountFromCircleData(list: case2_list, statusTag: "활동 중")
                
            case 1:
                return getCountFromCircleData(list: case2_list, statusTag: "폐지")
                
            case 2:
                return getCountFromCircleData(list: case2_list, statusTag: "신규")
                
            default:
                return 0
            }
            
        default:
            return getCountFromCircleData(list: Dummy_circleCellDataList, tag: "")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: circleCollectionViewCell.cellID, for: indexPath) as? circleCollectionViewCell else { return UICollectionViewCell() }
        
        let cellDataInstance: circleCellData?
        
        let index = self.tableViewIndex + 1
        switch index {
            
        case 1:
            
            let case1_list = getListFromCircleData(list: Dummy_circleCellDataList, tag: "교내")
            
            switch collectionView.tag {
                
            case 0:
                cellDataInstance = getListFromCircleData(list: case1_list, statusTag: "활동 중")[indexPath.row]
                
            case 1:
                cellDataInstance = getListFromCircleData(list: case1_list, statusTag: "폐지")[indexPath.row]
                
            case 2:
                cellDataInstance = getListFromCircleData(list: case1_list, statusTag: "신규")[indexPath.row]
                
            default:
                cellDataInstance = nil
            }
            
            //연합
        case 2:
            let case2_list = getListFromCircleData(list: Dummy_circleCellDataList, tag: "연합")
            
            switch collectionView.tag {
                
            case 0:
                cellDataInstance = getListFromCircleData(list: case2_list, statusTag: "활동 중")[indexPath.row]
                
            case 1:
                cellDataInstance = getListFromCircleData(list: case2_list, statusTag: "폐지")[indexPath.row]
                
            case 2:
                cellDataInstance = getListFromCircleData(list: case2_list, statusTag: "신규")[indexPath.row]
                
            default:
                cellDataInstance = nil
            }
            
        default:
            cellDataInstance = nil
        }
        
        if let instance = cellDataInstance {
            cell.fetchData(data: instance)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.view.frame.width/1.75, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MainDetailVC(), animated: true)
    }
    
}

struct ApplyVC_Preview: PreviewProvider {
    static var previews: some View {
        ApplyVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
