//
//  TabBarController.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//


import UIKit

// MARK: - 메인 들어가면 표시되는 탭바 컨트롤러 구현 화면

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = Main01
        
        // MARK: Variables
        
        let mainVC = MainVC()
        mainVC.tabBarItem.title = "메인"
        mainVC.tabBarItem.image = UIImage(systemName: "house.fill")
        mainVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let applyVC = ApplyVC()
        applyVC.tabBarItem.title = "지원"
        applyVC.tabBarItem.image = UIImage(systemName: "envelope")
        applyVC.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        let reportVC = ReportVC()
        reportVC.tabBarItem.title = "등록"
        reportVC.tabBarItem.image = UIImage(systemName: "pencil")
        reportVC.tabBarItem.selectedImage = UIImage(systemName: "pencil.line")
        
        let mypageVC = UserVC()
        mypageVC.tabBarItem.title = "마이"
        mypageVC.tabBarItem.image = UIImage(systemName: "person")
        mypageVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        let titleButton = UIBarButtonItem(image: UIImage(named: "barLogoItem"),
                                          style: .plain,
                                          target: self,
                                          action: .none)
        
        let logoButton = UIBarButtonItem(image: UIImage(named: "TitleImage"),
                                         style: .plain,
                                         target: self,
                                         action: .none)
        
        let settingButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"),
                                            style: .plain,
                                            target: self,
                                            action: .none)
        
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        let applyNavigationController = UINavigationController(rootViewController: applyVC)
        let reportNavigationController = UINavigationController(rootViewController: reportVC)
        let mypageNavigationController = UINavigationController(rootViewController: mypageVC)
        
        
        // MARK: Navigation Bar 커스텀
        [
            mainNavigationController,
            applyNavigationController,
            reportNavigationController,
            mypageNavigationController
        ].forEach {
            $0.navigationBar.tintColor = .black
        }
        
        [
            mainVC,
            applyVC,
            reportVC,
            mypageVC
        ].forEach {
            $0.title = ""
            $0.navigationItem.leftBarButtonItems = [titleButton, logoButton]
            $0.navigationItem.leftBarButtonItems![0].tintColor = Main01
            $0.navigationItem.setRightBarButtonItems([settingButton], animated: true)
            $0.navigationItem.rightBarButtonItems![0].tintColor = .black
        }
        
        setViewControllers([mainNavigationController,
                            applyNavigationController,
                            reportNavigationController,
                            mypageNavigationController], animated: true)
    }
}
