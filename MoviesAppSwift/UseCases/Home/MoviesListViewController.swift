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
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movies"
        self.definesPresentationContext = true
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
            self.tableView.tableFooterView = nil
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
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search movie"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.barStyle = .default
        self.extendedLayoutIncludesOpaqueBars = true

        searchController.searchBar.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
                                                                                      leading: 0,
                                                                                      bottom: 0,
                                                                                      trailing: 25)
        tableView.tableHeaderView = searchController.searchBar
        tableView.contentOffset = CGPoint(x: 0, y: searchController.searchBar.frame.size.height)
    }

}

// MARK: - ScrollViewDelegate
extension MoviesListViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scroll = scrollView.contentOffset.y
        if scroll > (tableView.contentSize.height-100-scrollView.frame.size.height){
            viewModel.getMovies()
            tableView.showFooterSpinner(view: view)
        }
    }
}


// MARK: - TableDelegates
extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movie = viewModel.filteredMovies[indexPath.row]
                
        return cell
    }
}

// MARK: - SearchDelegates
extension MoviesListViewController: UISearchControllerDelegate, UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //searchController.isActive = false
        viewModel.filteredMovies = viewModel.movies.value
        reloadTableView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterMovie(searchText: searchText)
        reloadTableView()
    }
    
}
