//
//  PracticeSessionCell.swift
//  FretelloCodingChallenge
//
//  Created by Chioma Mmegwa on 28/01/2021.
//

import UIKit

class PracticeSessionCell: UITableViewCell {
    
    var session: Exercise? {
        didSet {
            if let session = session {
                excerciseNameLabel.text = session.name
                practiceTimeLabel.text = String(session.practicedAtBPM ?? 0)
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
        cellView.layer.cornerRadius = 10
        return cellView
    }()
    
    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "guitar")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let excerciseNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "textColor")
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let practiceTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "textColor")
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    func setupViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(exerciseImageView)
        cellView.addSubview(excerciseNameLabel)
        cellView.addSubview(practiceTimeLabel)
        
        cellView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.left.equalTo(contentView.snp.left).offset(15)
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
            make.height.equalTo(200)
        }
        
        exerciseImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(cellView)
            make.top.equalTo(cellView).offset(10)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }

        excerciseNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(cellView)
            make.top.equalTo(exerciseImageView.snp.bottom).offset(20)
        }

        practiceTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(excerciseNameLabel.snp.bottom).offset(20)
            make.centerX.equalTo(cellView)
        }
    }
}
