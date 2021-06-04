//
//  ShowDetailView.swift
//  Afya
//
//  Created by Daniel Oliveira on 04/06/21.
//

import UIKit
import SnapKit

class ShowDetailView: UIView {

    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        return label
    }()
    
    lazy var scheduleLabel:UILabel = {
        let label = UILabel(frame: .zero)
        
        return label
    }()
    
    lazy var genderLabel:UILabel = {
        let label = UILabel(frame: .zero)
        
        return label
    }()

    
    func setUpView() {
        
    }
    
}
