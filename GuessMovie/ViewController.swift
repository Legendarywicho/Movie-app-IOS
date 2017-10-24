//
//  ViewController.swift
//  GuessMovie
//
//  Created by Luis Santiago  on 10/23/17.
//  Copyright © 2017 Luis Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct globalVariables{
        static var movies: [UIImage]? = [#imageLiteral(resourceName: "spiderman"), #imageLiteral(resourceName: "rickandmortys1.png"), #imageLiteral(resourceName: "silicon15_02"),#imageLiteral(resourceName: "dragon.jpg")];
        static var titleMovies : [String]? = ["Spiderman - Homecoming", "Rick and Morty", "silicon valley", "Dragon Ball super"];
        static var numerGeneral: Int = ((movies?.count)!) - 1;
    }
    
    var label: UILabel?;
    var imageView: UIImageView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadUI(){
        view.backgroundColor = .white;
        navigationItem.title = "Choose your movie";
        
        let button = UIButton(type: UIButtonType.system);
        button.setTitle("Change Movie", for: .normal);
        button.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(button);
        
        //Setting up constraints
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: -10).isActive = true;
        //Height
        button.heightAnchor.constraint(equalToConstant: 10).isActive = true;
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside);
        
        
        label = UILabel();
        label?.text = globalVariables.titleMovies?[globalVariables.numerGeneral];
        label?.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(label!);
        //Setting constraints
        label?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        label?.heightAnchor.constraint(equalToConstant: 30).isActive = true;
        label?.topAnchor.constraint(equalTo:  button.bottomAnchor, constant: -100).isActive = true;
        label?.bottomAnchor.constraint(equalTo: (button.bottomAnchor), constant: 100).isActive = true;
        imageView = UIImageView();
        imageView?.image = globalVariables.movies?[globalVariables.numerGeneral];
        imageView?.translatesAutoresizingMaskIntoConstraints = false;
        
        view.addSubview(imageView!);
        //setting constraints
        imageView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        imageView?.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true;
        imageView?.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true;
        imageView?.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.40).isActive = true;
        imageView?.topAnchor.constraint(equalTo: (label?.bottomAnchor)!, constant: -20).isActive = true;
        imageView?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true;
        /*imageView?.topAnchor.constraint(equalTo: (label?.bottomAnchor)!, constant: 50).isActive = true;*/
        
        
    }
    @objc func onClick(){
        globalVariables.numerGeneral = globalVariables.numerGeneral - 1;
        label?.text = globalVariables.titleMovies?[globalVariables.numerGeneral];
        imageView?.image = globalVariables.movies?[globalVariables.numerGeneral];
        if( globalVariables.numerGeneral == 0){
             globalVariables.numerGeneral = ((globalVariables.movies?.count)!) - 1;
        }
    }
}

