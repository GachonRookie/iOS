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


class ApplyVC: UIViewController {

    // MARK: Variables

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpLayout()
        setUpDelegate()
        setUpConstraint()
    }
    

    // MARK: View
    
    func setUpView() {
        
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

struct ApplyVC_Preview: PreviewProvider {
    static var previews: some View {
        ApplyVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
