//
//  TableViewCell.swift
//  AlefDevelopment
//
//  Created by Maxim Bekmetov on 01.11.2021.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func getTapButton(indexPath: IndexPath)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    
    @IBOutlet weak var delete: UIButton!
    
    @IBOutlet weak var nameSmallView: UIView!
    @IBOutlet weak var ageSmallView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nameSmallView.layer.cornerRadius = 5
        nameSmallView.layer.borderWidth = 0.2
        nameSmallView.layer.borderColor = UIColor.gray.cgColor
        
        ageSmallView.layer.cornerRadius = 5
        ageSmallView.layer.borderWidth = 0.2
        ageSmallView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didtap(_ sender: Any) {
        
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        if let thisIndexPath = tableView?.indexPath(for: self) {
            delegate?.getTapButton(indexPath: thisIndexPath)
        }
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        var view = superview
        while let v = view, v.isKind(of: UITableView.self) == false {
            view = v.superview
        }
        return view as? UITableView
    }
}
