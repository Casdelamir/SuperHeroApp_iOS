//
//  ViewController.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 9/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroList: [SuperHero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        // Setup SearchBar
        let search = UISearchController(searchResultsController: nil)
        //equal to self is used for rendering another controler on searching
        //search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SuperHeroViewCell
        
        let superHero = superHeroList[indexPath.row]
        
        cell.render(superHero: superHero)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as! DetailViewController

            let indexPath = tableView.indexPathForSelectedRow!
 
            viewController.superHero = superHeroList[indexPath.row]

           tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    // MARK: SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSuperHeroes(searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchSuperHeroes("a")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            searchSuperHeroes("a")
        }
    }
    
    func searchSuperHeroes(_ query: String) {
        Task {
            let results = try? await DataProvider.findSuperHeroesByName(query)
            
            self.superHeroList = results ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

