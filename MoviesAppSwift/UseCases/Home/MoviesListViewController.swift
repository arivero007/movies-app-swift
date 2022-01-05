//
//  MoviesListViewController.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

class MoviesListViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: MoviesListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var searchController: UISearchController = {
       let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = true
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.sizeToFit()
        controller.searchBar.text = "Search movie"
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movies"
        registerCell()
        setBindings()
        manageSearchController()
    }
    
    private func setBindings(){
        viewModel.movies.addObserver { [weak self] movies in
            self?.reloadTableView()
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func registerCell() {
        let cell = UINib(nibName: "MovieTableViewCell",
                         bundle: Bundle.main)
        self.tableView.register(cell,
                                forCellReuseIdentifier: "movieCell")
    }
    
    private func manageSearchController(){
        let searchBar = searchController.searchBar
        searchController.delegate = self
        tableView.tableHeaderView = searchBar
        tableView.contentOffset = CGPoint(x: .zero, y: searchBar.frame.size.height)
    }


}

// MARK: - TableDelegates
extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movie = viewModel.movies.value[indexPath.row]
                
        return cell
    }
}

// MARK: - SearchDelegates
extension MoviesListViewController: UISearchControllerDelegate{
    
}
