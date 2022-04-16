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
     kad stavim label.top to bottom of another label ne rade mi inseti i ofseti
     scroll ne radi
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
    private var caracter1: UILabel!
    private var caracter2: UILabel!
    private var director: UILabel!
    private var screenplay1: UILabel!
    private var screenplay2: UILabel!
    private var screenplay3: UILabel!
    private var caracter1label: UILabel!
    private var caracter2label: UILabel!
    private var directorlabel: UILabel!
    private var screenplay1label: UILabel!
    private var screenplay2label: UILabel!
    private var screenplay3label: UILabel!

    
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
        
        caracter1 = UILabel()
        caracter1.text = "Don Heck"
        contentView.addSubview(caracter1)
        
        caracter2 = UILabel()
        caracter2.text = "Jack Kirby"
        contentView.addSubview(caracter2)
        
        director = UILabel()
        director.text = "Jon Favreau"
        contentView.addSubview(director)
        
        screenplay1 = UILabel()
        screenplay1.text = "Don Heck"
        contentView.addSubview(screenplay1)
        
        screenplay2 = UILabel()
        screenplay2.text = "Jack Marcum"
        contentView.addSubview(screenplay2)
        
        screenplay3 = UILabel()
        screenplay3.text = "Matt Holloway"
        contentView.addSubview(screenplay3)
        
        caracter1label = UILabel()
        caracter1label.text = "Characters"
        contentView.addSubview(caracter1label)
        
        caracter2label = UILabel()
        caracter2label.text = "Characters"
        contentView.addSubview(caracter2label)
        
        directorlabel = UILabel()
        directorlabel.text = "Director"
        contentView.addSubview(directorlabel)
        
        screenplay1label = UILabel()
        screenplay1label.text = "Screenplay"
        contentView.addSubview(screenplay1label)
        
        screenplay2label = UILabel()
        screenplay2label.text = "Screenplay"
        contentView.addSubview(screenplay2label)
        
        screenplay3label = UILabel()
        screenplay3label.text = "Screenplay"
        contentView.addSubview(screenplay3label)
    }
    
    func styleViews() {
        posterView.backgroundColor = .blue
        
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        durationLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.backgroundColor = .white
        
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        
        caracter1.font = UIFont.boldSystemFont(ofSize: 14)
        caracter2.font = UIFont.boldSystemFont(ofSize: 14)
        director.font = UIFont.boldSystemFont(ofSize: 14)
        screenplay1.font = UIFont.boldSystemFont(ofSize: 14)
        screenplay2.font = UIFont.boldSystemFont(ofSize: 14)
        screenplay3.font = UIFont.boldSystemFont(ofSize: 14)
        
        caracter1label.font = UIFont.systemFont(ofSize: 14)
        caracter2label.font = UIFont.systemFont(ofSize: 14)
        directorlabel.font = UIFont.systemFont(ofSize: 14)
        screenplay1label.font = UIFont.systemFont(ofSize: 14)
        screenplay2label.font = UIFont.systemFont(ofSize: 14)
        screenplay3label.font = UIFont.systemFont(ofSize: 14)
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
            $0.width.equalTo(view)
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
            $0.leading.trailing.equalTo(contentView).offset(16)
            $0.top.equalTo(contentView).offset(32)
        }
        
        overviewTextLabel.snp.makeConstraints {
            $0.leading.equalTo(overviewLabel.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.top.equalTo(overviewLabel.snp.bottom).offset(20)
        }
        
        caracter1.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(16)
            $0.top.equalTo(overviewTextLabel.snp.bottom).offset(32)
            $0.width.equalTo(caracter2)
        }
        
        caracter2.snp.makeConstraints {
            $0.leading.equalTo(caracter1.snp.trailing).offset(6)
            $0.trailing.equalTo(director.snp.leading)
            $0.top.equalTo(caracter1.snp.top)
        }
        
        director.snp.makeConstraints {
            $0.leading.equalTo(caracter2.snp.trailing).offset(6)
            $0.trailing.equalTo(contentView).inset(16)
            $0.top.equalTo(caracter1.snp.top)
            $0.width.equalTo(caracter2)
        }
        
        caracter1label.snp.makeConstraints {
            $0.leading.equalTo(caracter1.snp.leading)
            $0.trailing.equalTo(caracter1.snp.trailing)
            $0.top.equalTo(caracter1.snp.bottom).offset(4)
        }
        
        caracter2label.snp.makeConstraints {
            $0.leading.equalTo(caracter2.snp.leading)
            $0.trailing.equalTo(caracter2.snp.trailing)
            $0.top.equalTo(caracter1.snp.bottom).offset(4)
        }
        
        directorlabel.snp.makeConstraints {
            $0.leading.equalTo(director.snp.leading)
            $0.trailing.equalTo(director.snp.trailing)
            $0.top.equalTo(director.snp.bottom).offset(4)
        }
        
        
        screenplay1.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.top.equalTo(caracter1label.snp.bottom).offset(24)
            $0.width.equalTo(screenplay2)
        }
        
        screenplay2.snp.makeConstraints {
            $0.leading.equalTo(screenplay1.snp.trailing).offset(6)
            $0.trailing.equalTo(screenplay3.snp.leading)
            $0.top.equalTo(screenplay1.snp.top)
        }
        
        screenplay3.snp.makeConstraints {
            $0.leading.equalTo(screenplay2.snp.trailing).offset(6)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.top.equalTo(screenplay1.snp.top)
            $0.width.equalTo(screenplay2)
        }
        
        
        screenplay1label.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.top.equalTo(screenplay1.snp.bottom).offset(4)
            $0.width.equalTo(screenplay2label)
        }
        
        screenplay2label.snp.makeConstraints {
            $0.leading.equalTo(screenplay1label.snp.trailing).offset(6)
            $0.trailing.equalTo(screenplay3label.snp.leading)
            $0.top.equalTo(screenplay1label.snp.top)
        }
        
        screenplay3label.snp.makeConstraints {
            $0.leading.equalTo(screenplay2label.snp.trailing).offset(6)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.top.equalTo(screenplay1label.snp.top)
            $0.width.equalTo(screenplay2label)
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
