//
//  ViewController.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var networkService: Networkp1Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService = Networkp1ServiceImp()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "part1" {
            guard let segueDestinationVC = segue.destination as? Part1ViewController else { return }
            let viewModel = Part1ViewModelImp()
            segueDestinationVC.configure(viewModel: viewModel)
            
        } else if segue.identifier == "part2" {
        
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

