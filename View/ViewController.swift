//
//  ViewController.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let myTableView = UITableView()
    let cellId = "cell"
    var myObservable: todoDataObservable!
    //var myCoreDataService: coreDataService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(myTableView)
        configureTableView()
        myUIUpdate()
        
    }
    
    func myUIUpdate()
    {
        //myCoreDataService = coreDataService()
        myObservable = todoDataObservable()
        myObservable.bindToController =
        {
            DispatchQueue.main.async
            {
                self.myTableView.reloadData()
            }
        }
    }
    
    func configureTableView()
    {
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myObservable.myJSONData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        cell.idLabel.text = String(myObservable.myJSONData[indexPath.row].id)
        cell.userIdLabel.text = String(myObservable.myJSONData[indexPath.row].userId)
        cell.completedLabel.text = String(myObservable.myJSONData[indexPath.row].completed)
        cell.titleLabel.text = myObservable.myJSONData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

