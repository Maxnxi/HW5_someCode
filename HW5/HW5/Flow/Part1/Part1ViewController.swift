//
//  Part1ViewController.swift
//  HW5
//
//  Created by Ponomarev Maksim on 25.08.2022.
//

import UIKit

class Part1ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let networkService: Networkp1Service
    let urlString: String
    var collectionData: [SomeObject] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(service: Networkp1Service, urlStr: String) {
        self.networkService = service
        self.urlString = urlStr
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        print("Do required init")
        self.networkService = Networkp1ServiceImp()
        self.urlString = URL_StringForFetchP1
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    func loadData(string: String) async {
        collectionData = await networkService.fetchData(urlString: string)
    }
    

   

}

extension Part1ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Part1CollectionViewCell.reusableCellIdentifier, for: indexPath) as? Part1CollectionViewCell else {
            return UICollectionViewCell()
        }
        let celldata = collectionData[indexPath.row]
        cell.configureUI(id: celldata.id, name: celldata.name, email: celldata.email)
        return cell
    }
    
    
    
}
