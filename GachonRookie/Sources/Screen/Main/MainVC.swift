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
        ].forEach { view.addSubview($0) }
    }
    
    // MARK: Delegate
    
    func setUpDelegate() {
        
    }
    
    
    // MARK: Constraint
    
    func setUpConstraint() {
    }
    
}


struct MainVC_Preview: PreviewProvider {
    static var previews: some View {
        LoginVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}

