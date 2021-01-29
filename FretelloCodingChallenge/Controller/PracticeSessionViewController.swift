//
//  ViewController.swift
//  FretelloCodingChallenge
//
//  Created by Chioma Mmegwa on 28/01/2021.
//

import UIKit
import SnapKit

class PracticeSessionViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, PracticeSessionProtocol {
    
    var getData: [WelcomeElement]?
    
    func getData(sessionData: [WelcomeElement]) {
        self.getData = sessionData
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        setupTableView()
        
        let sessionLoader = DataLoader()
        sessionLoader.getDataDelegate = self
        sessionLoader.getData()
    }
    
    let bannerView: UIImageView = {
        let bannerView = UIImageView()
        bannerView.image = UIImage(named: "Fretello2")
        return bannerView
    }()
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.separatorStyle = UITableViewCell.SeparatorStyle.none
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    func setupTableView() {
        tableview.register(PracticeSessionCell.self, forCellReuseIdentifier: "cellId")
        tableview.delegate = self
        tableview.dataSource = self
        
        view.addSubview(bannerView)
        view.addSubview(tableview)
        
        bannerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(250)
        }
        
        tableview.snp.makeConstraints { (make) in
            make.top.equalTo(bannerView.snp.bottom)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getData?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData?[section].exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PracticeSessionCell
        let path = getData?[indexPath.section].exercises?[indexPath.row]
        cell.session = path
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("yeah")
        return self.getData?[section].name
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        let titleLabel = UILabel()
        titleLabel.text = (getData?[section].name) //?.uppercased()
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.frame = CGRect(x: 15, y: -7 , width: self.view.frame.width, height: 50)
        sectionHeaderView.addSubview(titleLabel)
        
        let dateLabel = UILabel()
        dateLabel.text = String((getData?[section].practicedOnDate)?.prefix(10) ?? "")
        dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        dateLabel.font = UIFont.boldSystemFont(ofSize: 14)
        dateLabel.frame = CGRect(x: 15, y: 7 , width: self.view.frame.width, height: 50)
        sectionHeaderView.addSubview(dateLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(sectionHeaderView)
            make.top.equalTo(sectionHeaderView).offset(10)
            make.left.equalTo(sectionHeaderView.snp.left).offset(10)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(sectionHeaderView)
            make.top.equalTo(sectionHeaderView).offset(10)
            make.right.equalTo(sectionHeaderView.snp.right).offset(-20)
        }
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
}

