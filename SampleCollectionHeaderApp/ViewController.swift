//
//  ViewController.swift
//  SampleCollectionHeaderApp
//
//  Created by Petar Glisovic on 3/5/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let kGridCellReuseIdentifier = "CollectionCell"
    let kGridHeaderReuseIdentifier = "CollectionHeaderView"
    
    let idealCellWidth: CGFloat = 100
    let margin: CGFloat = 5
    
    private var cities : [City] = [ City(image: "Ankara", name: "Ankara"),
                                        City(image: "Antalya", name: "Antalya"),
                                        City(image: "Aydin", name: "Aydin"),
                                        City(image: "Bodrum", name: "Bodrum"),
                                        City(image: "Canakkale", name: "Canakkale"),
                                        City(image: "Cappadocia", name: "Cappadocia"),
                                        City(image: "Efes", name: "Efes"),
                                        City(image: "Eskisehir", name: "Eskisehir"),
                                        City(image: "Fethiye", name: "Fethiye"),
                                        City(image: "Istanbul", name: "Istanbul"),
                                        City(image: "Izmir", name: "Izmir"),
                                        City(image: "Mardin", name: "Mardin"),
                                        City(image: "Nemrut", name: "Nemrut"),
                                        City(image: "Pamukkale", name: "Pamukkale"),
                                        City(image: "Patara", name: "Patara"),
                                        City(image: "Rize", name: "Rize"),
                                        City(image: "Salda", name: "Salda"),
                                        City(image: "Sumela", name: "Sumela")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title  = "Collection Header View"
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: kGridCellReuseIdentifier)
        self.collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kGridHeaderReuseIdentifier)
        
        
        // Od iOS13 postoji nesto sto se zove UICollectionViewCompositionalLayout. Tako je napravljena AppStore app ili Photos app na primer
        // podrazumeva UICollectionView koji moze da poseduje redove koji se skroluju horizontalno u sastavu velikog sveobuhvatnog collection view-a koji se skroluje vertikalno
        // https://www.raywenderlich.com/5436806-modern-collection-views-with-compositional-layouts
        // https://medium.com/flawless-app-stories/all-what-you-need-to-know-about-uicollectionviewcompositionallayout-f3b2f590bdbe
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.row + 1)
        }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGridCellReuseIdentifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        
        let city = cities[indexPath.row]
        cell.imageView.image = UIImage(named: city.image)
        cell.label.text = city.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kGridHeaderReuseIdentifier, for: indexPath) as? CollectionHeaderView else {
                return UICollectionReusableView()
            }
            
            headerView.headerTitleLbl.text = "Turkey"
            headerView.headerSubtittleLbl.text = "Vacation"
            
            return headerView
        }
        
        fatalError()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width-10) / 2
        return CGSize(width: width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: 200)
    }
}
