//
//  MoviesList.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Cocoa

class MoviesListVC: BaseVC {
    
    //MARK: - View
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    //MARK: - Variables
    
    private var viewModel = MoviesListVM()
    
    //MARK: - VC cycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        Networking.shared.delegate = self
        
        configureUI()
        configureCollectionView()
    }
    
    //MARK: - Private methods
    
    private func configureUI() {
        
        Networking.shared.getPopularMovies()
        
        // Configure scrollView
        scrollView.horizontalScroller?.isHidden = true
        scrollView.verticalScroller?.isHidden = true
    }
    
    private func configureCollectionView() {
        
        // Flow layout configuration
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 200, height: 300)
        flowLayout.minimumInteritemSpacing = 20.0
        flowLayout.minimumLineSpacing = 20.0
        
        // Collection view layout
        collectionView.collectionViewLayout = flowLayout
        collectionView.layer?.backgroundColor = Design.Colors.brandColor1.cgColor
        collectionView.layer?.backgroundColor = NSColor.white.cgColor
        collectionView.register(MovieCollectionViewItem.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MovieCollectionViewItem"))
    }
}

//MARK: - UICollectionViewDelegate && UICollectionViewDataSource

extension MoviesListVC: NSCollectionViewDelegate, NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.moviesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("MovieCollectionViewItem"), for: indexPath)
        guard let collectionViewItem = item as? MovieCollectionViewItem else { return item }
        collectionViewItem.movie = Constants.moviesList?[indexPath.item]
        print(indexPath.item)
        return item
    }
    
        
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        performSegue(withIdentifier: "showDetailedView", sender: self)
    }
}

//MARK: - Networking
extension MoviesListVC: NetworkingDelegate {
    
    func popularMoviesDataUpdate() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
