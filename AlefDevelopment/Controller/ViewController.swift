//
//  ViewController.swift
//  AlefDevelopment
//
//  Created by Maxim Bekmetov on 01.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addChild: UIButton!
    @IBOutlet weak var clean: UIButton!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    var childrenNumber : [Int] = []
    
    fileprivate func extractedFunc() {
        // Do any additional setup after loading the view.
        
        nameView.layer.cornerRadius = 5
        nameView.layer.borderWidth = 0.2
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        
        ageView.layer.cornerRadius = 5
        ageView.layer.borderWidth = 0.2
        ageView.layer.borderColor = UIColor.lightGray.cgColor
        
        addChild.layer.masksToBounds = true
        addChild.layer.cornerRadius = 22
        addChild.layer.borderWidth = 2
        addChild.layer.borderColor = UIColor.systemBlue.cgColor
        
        clean.layer.masksToBounds = true
        clean.layer.cornerRadius = 22
        clean.layer.borderWidth = 2
        clean.layer.borderColor = UIColor.red.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        extractedFunc()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    @IBAction func addChild(_ sender: UIButton) {
        childrenNumber.append(1)
        tableView.reloadData()
        
        if childrenNumber.count == 4 {
            addChild.isHidden = true
        }
    }
    
    @IBAction func clean(_ sender: UIButton) {
        
        let alert = UIAlertController()
        
        alert.addAction(UIAlertAction(title: "Сбросить данные", style: .destructive , handler:{ (UIAlertAction)in
            self.childrenNumber = []
            self.addChild.isHidden = false
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childrenNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! TableViewCell
        
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: TableViewCellDelegate {
    func getTapButton(indexPath: IndexPath) {
        childrenNumber.remove(at: indexPath.row)
        tableView.reloadData()
    }
}
