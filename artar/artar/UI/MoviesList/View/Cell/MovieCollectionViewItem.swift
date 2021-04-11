//
//  MovieCollectionViewItem.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Foundation
import AppKit

class MovieCollectionViewItem: NSCollectionViewItem {
    
    //MARK: - View
    
    private var posterImageView: PosterImageView = {
        let imageView = PosterImageView()
        imageView.image = NSImage(named: "dummyImage")
        return imageView
    }()
    
    private var titlesStackView: NSStackView = {
        let stackView = NSStackView()
        stackView.orientation = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var posterTitle: NSTextField = {
        let textField = NSTextField()
        textField.isBordered = false
        textField.textColor = Design.Colors.brandColor3
        textField.isEditable = false
        textField.isSelectable = false
        textField.backgroundColor = .controlColor
        textField.drawsBackground = false
        textField.isBezeled = false
        textField.alignment = .right
        textField.font = NSFont.boldSystemFont(ofSize: 24)
        textField.lineBreakMode = .byWordWrapping
        textField.cell?.isScrollable = true
        textField.cell?.wraps = false
        textField.alignment = .left
        return textField
    }()
    
    private var posterSubTitle: NSTextField = {
        let textField = NSTextField()
        textField.isBordered = false
        textField.textColor = Design.Colors.brandColor3
        textField.isEditable = false
        textField.isSelectable = false
        textField.backgroundColor = .controlColor
        textField.drawsBackground = false
        textField.isBezeled = false
        textField.alignment = .right
        textField.font = NSFont.systemFont(ofSize: 13)
        textField.lineBreakMode = .byWordWrapping
        textField.cell?.isScrollable = true
        textField.cell?.wraps = false
        textField.alignment = .left
        return textField
    }()
    
    //MARK: - Variables
    
    var movie: Movie? {
        didSet {
            guard isViewLoaded else {
                print("WERTYUIO")
                return }
            configureUI(movie)
            configureLayout()

        }
    }
    
    //MARK: - Cell cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = Design.Colors.brandColor2.cgColor
        view.layer?.cornerRadius = Design.MovieListVC.cornerRadius
        
    }
    
    private func configureUI(_ movie: Movie?) {
        posterTitle.stringValue = movie?.title ?? "WTF?"
        posterSubTitle.stringValue = movie?.release_date ?? "WTF"
    }
    
    private func configureLayout() {
        
        // Setup posterImageView
        view.addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            posterImageView.topAnchor.constraint(equalTo: view.topAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 200),
            posterImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Setup titlesStackView
        view.addSubview(titlesStackView)
        titlesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titlesStackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            titlesStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titlesStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            titlesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        // Setup posterTitle
        titlesStackView.addArrangedSubview(posterTitle)
        posterTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterTitle.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        // Setup posterSubTitle
        titlesStackView.addArrangedSubview(posterSubTitle)
        posterSubTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterSubTitle.heightAnchor.constraint(equalToConstant: 13)
        ])
        
    }
    
    //  var imageFile: ImageFile? {
    //    didSet {
    //      guard isViewLoaded else { return }
    //      if let imageFile = imageFile {
    //        imageView?.image = imageFile.thumbnail
    //        textField?.stringValue = imageFile.fileName
    //      } else {
    //        imageView?.image = nil
    //        textField?.stringValue = ""
    //      }
    //    }
    //  }
    
}
