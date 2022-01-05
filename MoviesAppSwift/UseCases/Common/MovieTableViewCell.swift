//
//  MovieTableViewCell.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet{
            if let movie = self.movie{
                title.text = movie.title
                overview.text = movie.overview
                rating.text = "Valoración: \(movie.voteAverage)"
                guard let url = URL(string: Constants.imagesUrl + movie.posterPath) else {return}
                poster.load(url: url)
            }
        }
    }
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
