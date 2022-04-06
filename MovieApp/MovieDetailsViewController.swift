//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Bruno Busic on 30.03.2022..
//

import Foundation
import UIKit
import SnapKit

class MovieDetailsViewController: UIViewController {
    
    
    /*
     Problemi:
     kad rotiram screen sve mi se unisti
     u posteru trebam labele dodavati odozdola prema gore
     kako da dodam ou slicicu favorite
     ne mogu razbiti opis filma u vise redova
     
     */
    
    private var safeAreaView: UIView!
    private var posterView: UIView!
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    private var posterImage: UIImageView!
    private var popularityLabel: UILabel!
    private var userScoreLabel: UILabel!
    private var titleLabel: UILabel!
    private var releaseYearLabel: UILabel!
    private var releaseCountryLabel: UILabel!
    private var releaseDateLabel: UILabel!
    private var genreLabel: UILabel!
    private var durationLabel: UILabel!
    private var favoriteView: UIView!
    private var favoriteImage: UIImageView!
    
    private var overviewLabel: UILabel!
    private var overviewTextLabel: UILabel!
    
    private let leadingInset = 15
    
    init() {
        super.init(nibName: nil, bundle: nil)

        tabBarItem = UITabBarItem(title: "Primjer 1", image: nil, tag: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        buildViews()
        styleViews()
        addConstraints()
    }
    
    func buildViews(){
        safeAreaView = UIView()
        safeAreaView.backgroundColor = .green
        view.addSubview(safeAreaView)
        
        posterView = UIView()
        posterView.backgroundColor = .blue
        safeAreaView.addSubview(posterView)
        
        posterImage = UIImageView(image: UIImage(named: "ironman"))
        posterView.addSubview(posterImage)
        
        buildPosterLabels()
        
        
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        safeAreaView.addSubview(scrollView)
        
        contentView = UIView()
        contentView.backgroundColor = .purple
        scrollView.addSubview(contentView)
        
        buildScrollViewLabels()
    }
    
    func buildPosterLabels(){
        favoriteView = UIView()
        posterView.addSubview(favoriteView)
        
        favoriteImage = UIImageView(image: UIImage(systemName: "hearts.fill"))
        posterView.contentMode = .scaleAspectFit
        
        popularityLabel = UILabel()
        popularityLabel.text = "76%"
        popularityLabel.textColor = .white
        posterView.addSubview(popularityLabel)
        
        userScoreLabel = UILabel()
        userScoreLabel.text = "UserScore"
        userScoreLabel.textColor = .white
        posterView.addSubview(userScoreLabel)
        
        titleLabel = UILabel()
        titleLabel.text = "Iron man"
        titleLabel.textColor = .white
        posterView.addSubview(titleLabel)
        
        releaseYearLabel = UILabel()
        releaseYearLabel.text = "(2008)"
        releaseYearLabel.textColor = .white
        posterView.addSubview(releaseYearLabel)
        
        releaseCountryLabel = UILabel()
        releaseCountryLabel.text = "(US)"
        releaseCountryLabel.textColor = .white
        posterView.addSubview(releaseCountryLabel)
        
        releaseDateLabel = UILabel()
        releaseDateLabel.text = "05/02/2008"
        releaseDateLabel.textColor = .white
        posterView.addSubview(releaseDateLabel)
        
        genreLabel = UILabel()
        genreLabel.text = "Action, Science-fiction"
        genreLabel.textColor = .white
        posterView.addSubview(genreLabel)
        
        durationLabel = UILabel()
        durationLabel.text = "2h 6m"
        durationLabel.textColor = .white
        posterView.addSubview(durationLabel)
        
    }
    
    func buildScrollViewLabels() {
        
        overviewLabel = UILabel()
        overviewLabel.text = "Overview"
        contentView.addSubview(overviewLabel)
        
        overviewTextLabel = UILabel()
        overviewTextLabel.text = "After being held captive in Afghan cave, billionare engineer Tony Stark creates a unique weponized suit of armor to fight evel"
        overviewTextLabel.numberOfLines = 0
        contentView.addSubview(overviewTextLabel)
    }
    
    func styleViews() {
        posterView.backgroundColor = .blue
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        durationLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.backgroundColor = .white
    }
    
    func addConstraints() {
        let bounds = UIScreen.main.bounds
        safeAreaView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        posterView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(bounds.height*0.5)
        }
        
        posterImage.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(posterView.snp.bottom)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
        }
        
        addConstraintsInPosterView()
        addConstraintsInScroolView()
    }
    
    func addConstraintsInPosterView() {
        popularityLabel.snp.makeConstraints{
            $0.leading.equalTo(posterView).inset(16)
            $0.bottom.equalTo(titleLabel.snp.bottom).inset(28)
        }
        
        userScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(popularityLabel.snp.trailing).offset(8)
            $0.top.equalTo(popularityLabel.snp.top)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(popularityLabel.snp.leading)
            $0.bottom.equalTo(releaseDateLabel.snp.bottom).inset(36)
        }
        
        releaseYearLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.leading.equalTo(popularityLabel.snp.leading)
            $0.bottom.equalTo(durationLabel.snp.bottom).inset(28)
        }
        
        releaseCountryLabel.snp.makeConstraints {
            $0.leading.equalTo(releaseDateLabel.snp.trailing).offset(8)
            $0.top.equalTo(releaseDateLabel.snp.top)
        }
        
        genreLabel.snp.makeConstraints {
            $0.leading.equalTo(popularityLabel.snp.leading)
            $0.bottom.equalTo(posterView.snp.bottom).inset(40)
        }
        
        durationLabel.snp.makeConstraints {
            $0.leading.equalTo(genreLabel.snp.trailing).offset(8)
            $0.bottom.equalTo(genreLabel.snp.bottom)
        }
        
        favoriteView.snp.makeConstraints {
            $0.leading.equalTo(popularityLabel.snp.leading)
            $0.top.equalTo(genreLabel.snp.bottom).offset(20)
        }
    }
    
    func addConstraintsInScroolView() {
        
        overviewLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(16)
            $0.top.equalTo(contentView).offset(32)
        }
        
        overviewTextLabel.snp.makeConstraints {
            $0.leading.equalTo(overviewLabel.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing).offset(16)
            $0.top.equalTo(overviewLabel.snp.bottom).offset(20)
        }
    }
    
}



extension MovieDetailsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
    }

    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("scrollViewDidScrollToTop")
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging")
    }

}
