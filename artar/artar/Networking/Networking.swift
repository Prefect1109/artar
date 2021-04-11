//
//  Networking.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Foundation
import AppKit

protocol NetworkingDelegate {
    func popularMoviesDataUpdate()
}

class Networking {
    
    // init
    private init() {}
    
    static var shared = Networking()
    
    var delegate: NetworkingDelegate?
    
    //MARK: - Variables
    
    let decoder = JSONDecoder()
    
    //MARK: - Movies
    
    func getPopularMovies() {
        let url = URL(string: APIConstants.getPopularMoviesURL + APIConstants.apiKeyAsParameter)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let coderesponce = response as? HTTPURLResponse {
                print("Code: \(coderesponce.statusCode)")
                if let safeData = data {
//                    safeData.printJSON()
                    self.parsePopularMoviesData(safeData)
                }
            }
            if error != nil{
                print(error!)
            }
        }
        task.resume()
    }
    
    //MARK: - Parsing
    
    private func parsePopularMoviesData(_ data: Data) {
        do {
            let decodeData = try decoder.decode(MoviePopularResponse.self, from: data)
            Constants.moviesList = decodeData.results
        } catch {
            print("Error with parsing breed List data: \(error)")
        }
        print("Success decoding breed List data")
        delegate?.popularMoviesDataUpdate()
    }
}

extension Data {
    
    func printJSON() {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8){
            print(JSONString)
        }
    }
    
}
