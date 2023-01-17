//
//  TableViewController.swift
//  diploma
//
//  Created by Gleb Chumachenko on 29.09.22.
//

import UIKit

class TableViewController: UIViewController {
    
    var dataStruct = DataStruct()
    var data = DataLoader()
    var coredataManager = CoreDataManager(modelName: "diploma")
    var favouriteFests: [Favoutite] = []
    
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var festsTable: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.load()
        tuneUI()
        setSortButton()
       //fetchData()
    }
    
    
    private func tuneUI(){
        
        
        let nibCell = UINib(nibName: "CustomViewCell", bundle: nil)
        festsTable.register(nibCell, forCellReuseIdentifier: "customCell")
        festsTable.dataSource = self
        festsTable.delegate = self
        
    }
    
    let fetchRequest = Favoutite.fetchRequest()
    func fetchData() {

        do {
            favouriteFests = try coredataManager.context.fetch(fetchRequest)
            festsTable.reloadData()
            print("### fetched")
        }
        catch {
            print(error)
            print("### error")
        }
    }
    
    
    
    func setSortButton(){
        
        let sortClousure = {(action: UIAction) in
            print(action.title)
        }
        let isElectedClousure = {(action: UIAction) in
            let predicate = NSPredicate(format: "isElected == true")
            self.fetchRequest.predicate = predicate

            print(action.title)
        }
        sortButton.menu = UIMenu(children: [UIAction(title: "Favourite", handler: isElectedClousure), UIAction(title: "A-Z sorting", handler: sortClousure)])
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchView.searchTextField.resignFirstResponder()
    }
    
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomViewCell
        cell.cellLabel.text = data.users[indexPath.row].title
        cell.dateLabel.text = data.users[indexPath.row].date
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "festInfo", sender: nil)
        
        let title = data.users[indexPath.row].title
        UserDefaults.standard.set(title, forKey: "title")
        let date = data.users[indexPath.row].date
        UserDefaults.standard.set(date, forKey: "date")
        let body = data.users[indexPath.row].body
        UserDefaults.standard.set(body, forKey: "body")
        let image = dataStruct.festImage
        Singleton.shared.festImage = image
       
        
       
    }
}


