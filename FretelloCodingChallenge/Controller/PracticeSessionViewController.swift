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
            make.top.equalTo(bannerView.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PracticeSessionCell
        let path = getData?[indexPath.row]
        cell.session = path
        return cell
    }
}

