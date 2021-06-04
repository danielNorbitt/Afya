//
//  SerieTableViewCell.swift
//  Afya
//
//  Created by Daniel Oliveira on 03/06/21.
//

import UIKit
import SDWebImage

class SerieTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var serieImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var summaryLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.contentMode = .topLeft
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var stackViewText: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing = CGFloat(Constants.Spacing.low)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with serie:Serie) {
        titleLabel.text = serie.name
        summaryLabel.attributedText = serie.formattedSumary
        serieImageView.sd_setImage(with: (serie.image?.urlUmageMedium), placeholderImage:UIImage(systemName: "icloud.slash"))
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        summaryLabel.text = nil
        titleLabel.text = nil
        serieImageView.image = nil
    }
    
    private func setUpViews() {
        
        contentView.addSubview(backView)
        
        stackViewText.addArrangedSubview(titleLabel)
        stackViewText.addArrangedSubview(summaryLabel)
        
        backView.addSubview(stackViewText)
        backView.addSubview(serieImageView)
        
        backView.snp.makeConstraints { (make) in
            make.top.left.equalTo(Constants.Spacing.low)
            make.right.bottom.equalTo(-Constants.Spacing.low)
        }
        
        stackViewText.snp.makeConstraints { (make) in
            make.top.equalTo(Constants.Spacing.low)
            make.bottom.equalTo(-Constants.Spacing.low)
            make.right.equalTo(-Constants.Spacing.low)
            make.left.equalTo(serieImageView.snp.right).offset(Constants.Spacing.low)
        }
        
        serieImageView.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(200)
            make.top.equalTo(stackViewText)
            make.bottom.equalTo(-Constants.Spacing.medium)
            make.left.equalTo(Constants.Spacing.medium)
        }
    }
    
}

