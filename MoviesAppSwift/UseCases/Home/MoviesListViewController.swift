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
        fetchMovies()
    }
    
    private func fetchMovies(){
        
        if NetworkConnectivity.isConnected(){
            viewModel.getMovies {  [weak self] error in
                self?.tableView.tableFooterView = nil
                guard let error = error else {
                    return
                }
                self?.showAlert(title: "Warning", message: "An error has ocurred: \(error.rawValue)")
            }
        }else{
            showAlert(title: "Warning", message: "No internet connection!")
        }
        
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
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search movie"
        searchController.searchBar.sizeToFit()

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
            if !searchController.isActive{
                fetchMovies()
                tableView.showFooterSpinner(view: view)
            }
        }
    }
}


// MARK: - TableViewDataSource
extension MoviesListViewController: UITableViewDataSource{
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

// MARK: - TableViewDataDelegate
extension MoviesListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        coordinator?.presentView(with: viewModel.filteredMovies[indexPath.row], view: .detailView)
    }
}


// MARK: - SearchDelegates
extension MoviesListViewController: UISearchControllerDelegate, UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        viewModel.filteredMovies = viewModel.movies.value
        reloadTableView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterMovie(searchText: searchText)
        reloadTableView()
    }
    
}
