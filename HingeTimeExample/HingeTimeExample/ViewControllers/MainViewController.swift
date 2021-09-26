//
//  MainViewController.swift
//  HingeTimeExample
//
//  Created by Bansri Rawal on 9/25/21.
//

import UIKit

class MainViewController: UIViewController{
    
    // MARK: -Properties
    var businessVM: BusinessViewModel!
    let reuseIdentifier = "MainTableViewCell"
    var timer: Timer?
    var list : [BusinessTime] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        businessVM = BusinessViewModel()
        businessVM.delegate = self
        list = businessVM.businessList
        tableView.delegate = self
    }
    
    func registerCell(){
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func createTimer(){
        
        guard timer == nil else { return }
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
    }
    
    @objc func updateTimer(){
        guard let visibleIndexPaths = tableView.indexPathsForVisibleRows else { return }
        
        for visiblePath in visibleIndexPaths{
            //update cells
            if let cell = tableView.cellForRow(at: visiblePath) as? MainTableViewCell{
                let time = list[visiblePath.row].time
                if time > 0{
                    cell.updateTime(time)
                    list[visiblePath.row].time = time - 1
                }
            }
        }
    }

}

// MARK: TableViewDelegate/DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessVM.businessList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = businessVM.businessList
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MainTableViewCell
        cell.configure(list[indexPath.row].name)
        
        return cell 
    }
    
    
    
}

extension MainViewController: BusinessListDelegate{
    
    func listUpdated(_ businessList: [BusinessTime]) {
        list = businessList
    }
}
