//
//  ViewController.swift
//  TableView
//
//  Created by Alexey on 11.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    class TableViewCell: UITableViewCell {
        
    }
    var data = ["Леша Новаковский", "bazinga", "blackice", "Ivan Ishchenko", "Ivan Kapralov", "Sergo", "Tania", "Valentyn Bokhonov", "viktorqube", "Даниил Ефремов", "Дмитрий", "Серж Андрух"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
           case self.tableView:
              return self.data.count
            default:
              return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
           cell.textLabel?.text = self.data[indexPath.row]
           return cell
    }
    

    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
         self.navigationItem.title = "Table"
         self.navigationController?.navigationBar.prefersLargeTitles = true

         self.view.addSubview(self.tableView)
         self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
         self.tableView.dataSource = self

         self.updateLayout(with: self.view.frame.size)
    }

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
   
}

