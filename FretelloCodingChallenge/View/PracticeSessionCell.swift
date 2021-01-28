//
//  PracticeSessionCell.swift
//  FretelloCodingChallenge
//
//  Created by Chioma Mmegwa on 28/01/2021.
//

import UIKit

class PracticeSessionCell: UITableViewCell {
    
    var session: WelcomeElement? {
        didSet {
            if let session = session {
                titleLabel.text = session.name
                timeLabel.text = String(session.practicedOnDate?.prefix(10) ?? "")
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.6352941176, blue: 0.2352941176, alpha: 1)
        cellView.layer.cornerRadius = 10
        return cellView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        label.numberOfLines = 0
        label.text = "Introductory Session"
        label.textAlignment = .center
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.1568627451, green: 0.1529411765, blue: 0.1529411765, alpha: 1)
        label.numberOfLines = 0
        label.text = "2016-05-08"
        label.textAlignment = .center
        return label
    }()

    func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(timeLabel)
        
        cellView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
            make.height.equalTo(100)
        }
    
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(cellView)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top).offset(30)
            make.centerX.equalTo(cellView)
            make.bottom.equalTo(cellView.snp.bottom).offset(-30)
        }
    }
}
