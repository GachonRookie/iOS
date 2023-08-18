//
//  ReportVC.swift
//  GachonRookie
//
//  Created by YOUJIM on 2023/08/18.
//

import SwiftUI
import UIKit

import SnapKit
import Then


class ReportVC: UIViewController {

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

struct ReportVC_Preview: PreviewProvider {
    static var previews: some View {
        ReportVC().toPreview()
            // .edgesIgnoringSafeArea(.all)
    }
}
