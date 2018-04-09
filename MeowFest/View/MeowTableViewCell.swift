//
//  MeowTableViewCell.swift
//  MeowFest
//
//  Created by Alex Hoff on 3/28/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit

class MeowTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var item: Cat? {
        didSet {
            guard let item = item else { return }
            
            if let timestamp = item.timestamp {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                let date = dateFormatter.date(from: timestamp)
                timeLabel.text = date?.description
            }
            
            if let imageUrl = item.imageUrl {
                catImageView.loadImageUsingUrlString(urlString: imageUrl)
            }
            
            nameLabel.text = item.title
            descriptionLabel.text = item.description
        }
    }
    
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
