//
//  MainDetailVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/19.
//

import SafariServices
import SwiftUI
import UIKit

import SnapKit
import Then


class MainDetailVC: UIViewController {

    // MARK: Variables
    
    var scrollView: UIScrollView = UIScrollView()
    
    var contentView: UIView = UIView()
    
    var clubImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "image")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    var clubView: UIView = UIView().then {
        $0.backgroundColor = White
    }
    
    var clubTypeLabel: UILabel = UILabel().then {
        $0.text = "교내 동아리"
        $0.font = Paragraph4
    }
    
    var reportButton: UIButton = UIButton().then {
        $0.setTitle("리포트 보러가기 >", for: .normal)
        $0.titleLabel?.font = CaptionText4
        $0.setTitleColor(Gray07, for: .normal)
        $0.addTarget(self, action: #selector(didReportButtonTapped), for: .touchUpInside)
    }
    
    var clubNameLabel: UILabel = UILabel().then {
        $0.text = "동아리 이름"
        $0.font = Title2
    }
    
    var recruitButton: UIButton = UIButton().then {
        $0.setTitle("지원 링크", for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 14
        $0.setTitleColor(Black, for: .normal)
        $0.layer.borderColor = Main01.cgColor
        $0.layer.borderWidth = 0.7
    }
    
    var linkButton: UIButton = UIButton().then {
        $0.setTitle("https://www.welcomtobrocolibors.com", for: .normal)
        $0.setTitleColor(Main01, for: .normal)
        $0.titleLabel?.font = CaptionText1
        $0.contentHorizontalAlignment = .leading
        $0.addTarget(self, action: #selector(didLinkButtonTapped), for: .touchUpInside)
    }
    
    var clubContentView: UIView = UIView().then {
        $0.backgroundColor = White
    }
    
    var timeLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "활동 기간"
    }
    
    var timeDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리 활동 기간을 확인하세요."
        $0.textColor = Gray07
    }
    
    var timeContentLabel: UILabel = UILabel().then {
        $0.font = Paragraph1
        $0.text = "8월 26일 부터 12월 31일 까지"
    }
    
    var firstBottomView: UIView = UIView().then {
        $0.backgroundColor = Gray03
    }
    
    var peopleLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "모집 대상"
    }
    
    var peopleDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "유진님이 동아리 모집 대상에 해당되는지 확인하세요."
        $0.textColor = Gray07
    }
    
    var peopleContentLabel: UILabel = UILabel().then {
        $0.font = Paragraph1
        $0.text = "가천대학교 재학생 및 휴학생"
    }
    
    var secondBottomView: UIView = UIView().then {
        $0.backgroundColor = Gray03
    }
    
    var recruitingTermLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "모집 기간"
    }
    
    var recruitingTermDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리 모집 기간을 놓치지 않게 유의하세요."
        $0.textColor = Gray07
    }
    
    var recruitingTermContentLabel: UILabel = UILabel().then {
        $0.font = Paragraph1
        $0.text = "가천대학교 재학생 및 휴학생"
    }
    
    var thirdBottomView: UIView = UIView().then {
        $0.backgroundColor = Gray03
    }
    
    var recruitingPartLabel: UILabel = UILabel().then {
        $0.font = Title3
        $0.text = "모집 파트"
    }
    
    var recruitingPartDescriptionLabel: UILabel = UILabel().then {
        $0.font = CaptionText3
        $0.text = "동아리에서 지원하는 파트를 확인하세요.\n각 파트를 클릭하면 찜할 수 있어요."
        $0.numberOfLines = 2
        $0.textColor = Gray07
    }
    
    var recruitingPartContentLabel: UILabel = UILabel().then {
        $0.font = Paragraph1
        $0.text = "가천대학교 재학생 및 휴학생"
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
        view.backgroundColor = Gray01
        
        tabBarController?.tabBar.isHidden = true
    }
    
    
    // MARK: Layout
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [
            clubImageView,
            clubView,
            clubContentView
        ].forEach { contentView.addSubview($0) }
        
        [
            clubTypeLabel,
            reportButton,
            clubNameLabel,
            recruitButton,
            linkButton
        ].forEach { clubView.addSubview($0) }
        
        [
            timeLabel,
            timeDescriptionLabel,
            timeContentLabel,
            firstBottomView,
            peopleLabel,
            peopleDescriptionLabel,
            peopleContentLabel,
            secondBottomView,
            recruitingTermLabel,
            recruitingTermDescriptionLabel,
            recruitingTermContentLabel,
            thirdBottomView,
            recruitingPartLabel,
            recruitingPartDescriptionLabel,
            recruitingPartContentLabel
        ].forEach { clubContentView.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
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
        
        clubImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        clubView.snp.makeConstraints {
            $0.top.equalTo(clubImageView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        clubTypeLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
        }
        
        reportButton.snp.makeConstraints {
            $0.centerY.equalTo(clubTypeLabel)
            $0.leading.equalTo(clubTypeLabel.snp.trailing).offset(5)
        }
        
        clubNameLabel.snp.makeConstraints {
            $0.top.equalTo(clubTypeLabel.snp.bottom).offset(10)
            $0.leading.equalTo(clubTypeLabel)
        }
        
        recruitButton.snp.makeConstraints {
            $0.top.equalTo(clubNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(clubTypeLabel)
            $0.width.equalTo(70)
        }
        
        linkButton.snp.makeConstraints {
            $0.centerY.equalTo(recruitButton)
            $0.leading.equalTo(recruitButton.snp.trailing).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.bottom.equalToSuperview().offset(-30)
        }
        
        clubContentView.snp.makeConstraints {
            $0.top.equalTo(clubView.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(30)
        }
        
        timeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        timeContentLabel.snp.makeConstraints {
            $0.top.equalTo(timeDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        firstBottomView.snp.makeConstraints {
            $0.top.equalTo(timeContentLabel.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(1)
        }
        
        peopleLabel.snp.makeConstraints {
            $0.top.equalTo(firstBottomView.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
        }
        
        peopleDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(peopleLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        peopleContentLabel.snp.makeConstraints {
            $0.top.equalTo(peopleDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        secondBottomView.snp.makeConstraints {
            $0.top.equalTo(peopleContentLabel.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(1)
        }
        
        recruitingTermLabel.snp.makeConstraints {
            $0.top.equalTo(secondBottomView.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
        }
        
        recruitingTermDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(recruitingTermLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        recruitingTermContentLabel.snp.makeConstraints {
            $0.top.equalTo(recruitingTermDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        thirdBottomView.snp.makeConstraints {
            $0.top.equalTo(recruitingTermContentLabel.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(1)
        }
        
        recruitingPartLabel.snp.makeConstraints {
            $0.top.equalTo(thirdBottomView.snp.bottom).offset(20)
            $0.leading.equalTo(timeLabel)
        }
        
        recruitingPartDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(recruitingPartLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
        }
        
        recruitingPartContentLabel.snp.makeConstraints {
            $0.top.equalTo(recruitingPartDescriptionLabel.snp.bottom).offset(15)
            $0.leading.equalTo(timeLabel)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    
    // MARK: Function
    
    @objc func didLinkButtonTapped() {
        let url = NSURL(string: "https://www.welcomtobrocolibors.com")
        let URLView: SFSafariViewController = SFSafariViewController(url: url! as URL)
        
        self.present(URLView, animated: true, completion: nil)
    }
    
    @objc func didReportButtonTapped() {
        
    }
}

struct MainDetailVC_Preview: PreviewProvider {
    static var previews: some View {
        MainDetailVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
