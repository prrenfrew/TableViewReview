//
//  ViewController.swift
//  TableViewReview
//
//  Created by MAC on 9/1/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  let array = ["Hello", "Goodbye", "Farewell", "Sayonara"]
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    let nib = UINib(nibName: "TableViewCell", bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
  }
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Section \(section)"
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.array.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//    cell.textLabel?.text = self.array[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    cell.theLabel.text = self.array[indexPath.row]
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("selected cell at row \(indexPath.row)")
    print("the selected row represents the element \(self.array[indexPath.row])")
  }
}
