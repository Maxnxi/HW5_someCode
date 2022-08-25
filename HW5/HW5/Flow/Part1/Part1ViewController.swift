//
//  Part1ViewController.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import UIKit

class Part1ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: Part1ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadInViewModel()
    }
    
    func loadInViewModel() {
        Task {
            do {
                await self.viewModel?.handleViewReady()
                viewModel?.itemsChanged = { [unowned self] in
                    self.collectionView.reloadData()
                }
            } catch {
                print("Error")
            }
            
        }
    }
    
    func configure(viewModel: Part1ViewModel) {
        self.viewModel = viewModel
    }

    

   

}

extension Part1ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Part1CollectionViewCell.reusableCellIdentifier, for: indexPath) as? Part1CollectionViewCell else {
            return UICollectionViewCell()
        }
        print("prepare cell")
        if let celldata = viewModel?.item(index: indexPath.row) {
        cell.configureUI(id: celldata.id, name: celldata.name, email: celldata.email)
            print("cell configure ", celldata)
        }
        return cell
    }
    
    
    
}
