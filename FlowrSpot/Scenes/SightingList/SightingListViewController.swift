//
//  SightingListViewController.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

class SightingListViewController: UIViewController {
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    fileprivate func layout(_ addSBtn: MainButton) {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        footerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        addSBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(48)
        }
    }
    
    fileprivate func setupViews() {
        tableView = UITableView()
        //  tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //  tableView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        footerView.backgroundColor = UIColor.white
        self.view.addSubview(footerView)
        
        let addSBtn = MainButton(type: .system)
        addSBtn.setTitle(" Add New Sighting", for: .normal)
        footerView.addSubview(addSBtn)
        
        
        layout(addSBtn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        setupViews()
        
        
        
    }
    
    
}

extension SightingListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want in your table
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell with data
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

