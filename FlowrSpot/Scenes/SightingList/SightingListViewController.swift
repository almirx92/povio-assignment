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

    var tableView : UITableView!
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView = UITableView()
      //  tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false

        //  tableView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        footerView.backgroundColor = UIColor.orange
        self.view.addSubview(footerView)
        
//        let customButton = AddSightButton(type: .system)
//               customButton.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//               customButton.setTitle("Custom Button", for: .normal)
//               view.addSubview(customButton)
           
        // Use SnapKit to set up Auto Layout constraints
                tableView.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                    // This will make the table view fill its superview
                }
        
       
        
        footerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        
        
       
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

