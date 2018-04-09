//
//  MeowViewModel.swift
//  MeowFest
//
//  Created by Alex Hoff on 3/28/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation
import UIKit

protocol TableLoadProtocol {
    func reloadTableView()
}

class MeowViewModel: NSObject {
    fileprivate var request: AnyObject?
    var cats = [Cat]()
    var tableDelegate: TableLoadProtocol?
    
    
    override init() {
        super.init()
        
        getCats()
    }
    
    func getCats() {
        guard let url = URL(string: String.baseUrl) else { return }
        let catRequest = ApiRequest(url: url)
        request = catRequest
        catRequest.load { [weak self] (response: [Cat]?) in
            guard let response = response else { return }
            self?.cats = response
            self?.tableDelegate?.reloadTableView()
        }
    }
}

// MARK: - Table view data source
extension MeowViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MeowTableViewCell.identifier, for: indexPath) as? MeowTableViewCell{
            cell.item = cats[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: - Table view delegate
extension MeowViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
