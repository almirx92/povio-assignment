//
//  SightingListViewController.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

protocol SightingsDisplayLogic: AnyObject{
    func displaySightings(_ sightings: SightingsAPI.SightingsResponse)
    func displayError(title: String, message: String)
}

class SightingListViewController: UIViewController {
    //MARK: - Attributes
    var interactor : SightingBusinessLogic?
    var router: SightingRoutingLogic?
    
    private var dataSource: [SightingsAPI.Sighting] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    
    //MARK: - SubViews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SightingTableViewCell.self)
        return tableView
    }()
    
 //   private lazy var headerView = SightingListHeaderView()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var addSightButton: MainButton = {
        let button = MainButton(type: .system)
        button.setTitle("+ Add New Sighting", for: .normal)
        return button
    }()
    
    
    /// Layout Contrains
    fileprivate func layout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        footerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        addSightButton.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
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
        let presenter = SightingsPresenter()
        let router = SightingRouter()
        
        let viewController = self
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    func loadData() {
      interactor?.fetchSightingsList()
    }
    
    // MARK: - Lifecycles
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        addSubViews()
        layout()
        setup()
        loadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Display Logic
extension SightingListViewController: SightingsDisplayLogic{
    func displaySightings(_ sightings: SightingsAPI.SightingsResponse) {
        if let newSightings = sightings.sightings {
                    dataSource = newSightings
                }
    }
    
    func displayError(title: String, message: String) {
        return
    }
    
    
}

extension SightingListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want in your table
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(SightingTableViewCell.self)
        // Access the data for the current row
        if !dataSource.isEmpty {
            let data = dataSource[indexPath.row]
            cell.configure(data)  // Configure the cell with the data
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return headerView
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sightingId = dataSource[indexPath.row].id else { return }
        router?.openDetails(sightingId: sightingId)
    }
}
