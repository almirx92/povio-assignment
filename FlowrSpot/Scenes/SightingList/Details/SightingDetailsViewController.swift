//
//  SightingDetailsViewController.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

protocol SightingDetailsDisplayLogic: AnyObject {
    func displaySightingViewModel(sighting: SightingDetails.Sighting)
    func displayCommentsViewModel(comments: [CommentCellViewModel])
}

class SightingDetailsViewController: UIViewController {
    // MARK: - Properties
    private var interactor: SightingDetailsInteractor?
    
    private var commentsViewModels: [CommentCellViewModel] = [] {
        didSet {
            reloadSection(at: .comments)
        }
    }
    
    private var sighting: SightingDetails.Sighting? {
        didSet {
            reloadSection(at: .sighting)
        }
    }
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(SightingDetailsTableViewCell.self)
        tableView.register(CommentsTableViewCell.self)
        return tableView
    }()
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
    }
    
    init(sightingId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.backBarButtonItem?.title = ""
        setup()
        setupTableView()
        addSubviews()
        layout()
        setupUI()
        fetchData(sightingId: sightingId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let viewController = self
        let interactor = SightingDetailsInteractor()
        let presenter = SightingDetailsPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func fetchData(sightingId: Int) {
        interactor?.fetchSighting(sightingId: sightingId)
        interactor?.fetchComments(sightingId: sightingId, page: 0)
    }
    
    // MARK: - Setup tableview
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Layout
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func layout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SightingDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = getSection(section: section)
        switch section {
        case .sighting:
            return 1
        case .comments:
            return commentsViewModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = getSection(section: indexPath.section)
        switch section {
        case .sighting:
            let cell = tableView.dequeueCell(SightingDetailsTableViewCell.self)
            if let sighting {
                cell.configure(sighting)
            }
            return cell
        case .comments:
            let cell = tableView.dequeueCell(CommentsTableViewCell.self)
            if !commentsViewModels.isEmpty {
                cell.configure(commentViewModel: commentsViewModels[indexPath.row])
            }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SightingDetails.TableView.Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Get section
    private func getSection(section: Int) -> SightingDetails.TableView.Section {
        guard let section = SightingDetails.TableView.Section(rawValue: section) else {
            fatalError("Section not defined.")
        }
        return section
    }
    
    func reloadSection(at section: SightingDetails.TableView.Section) {
        let indexSet = IndexSet(integer: section.rawValue)
        tableView.reloadSections(indexSet, with: .none)
    }
}

extension SightingDetailsViewController: SightingDetailsDisplayLogic {
    func displaySightingViewModel(sighting: SightingDetails.Sighting) {
        self.sighting = sighting
    }
    
    func displayCommentsViewModel(comments: [CommentCellViewModel]) {
        self.commentsViewModels = [CommentCellViewModel(name: "Test", comment: "Test")]
    }
    
    
}

