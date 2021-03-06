//
//  MovieDetailViewController.swift
//  MoviesAppSwift
//
//  Created by AlexR on 5/1/22.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: MovieDetailViewModel!
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var poster: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovie()
    }
    
    func loadMovie(){
        movieTitle.text = viewModel.movie.title
        overview.text = viewModel.movie.overview
        rating.text = "Valoración: \(viewModel.movie.voteAverage)"
        guard let url = URL(string: Constants.imagesUrl + viewModel.movie.posterPath) else{return}
        poster.sd_setImage(with: url, placeholderImage: UIImage(named: "default-movie"))
    }

}
