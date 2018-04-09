//
//  MeowViewController.swift
//  MeowFest
//
//  Created by Alex Hoff on 3/28/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit

class MeowViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MeowViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .lightGray
        
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        
        tableView.register(MeowTableViewCell.nib, forCellReuseIdentifier: MeowTableViewCell.identifier)
        
        viewModel.tableDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MeowViewController: TableLoadProtocol {
    func reloadTableView() {
        tableView.reloadData()
    }
}
