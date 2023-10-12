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
    //MARK :- SubViews
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SightingTableViewCell.self)
        return tableView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var addSightButton: MainButton = {
        let button = MainButton(type: .system)
        button.setTitle(" Add New Sighting", for: .normal)
        return button
    }()
    
    private var interactor: SightingBusinessLogic?
    
    /// Layout Contrains
    fileprivate func layout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        footerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
        
        addSightButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(48)
        }
    }
    
    /// Adding subviews screen
    fileprivate func addSubViews() {
        self.view.addSubview(tableView)
        self.view.addSubview(footerView)
        footerView.addSubview(addSightButton)
    }
    
    func setup(){
        let interactor = SightingsInteractor()
        self.interactor = interactor
    }
    
    // MARK :- Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        addSubViews()
        layout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchSightingsList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.fetchSightingsList()
    }
}

extension SightingListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want in your table
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(SightingTableViewCell.self)
        
        // Configure the cell with data
        //cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}

