//
//  HomeViewController.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let serieService = SerieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.view.backgroundColor = .systemBlue
    
        self.serieService.getSearcheSeriesByName(by: "girls") { (result) in
            switch result {
            case .success(let series):
                debugPrint(series.count)
            case .failure(let error):
                debugPrint(error)
            }
        }
         
    }
}
