//
//  ViewController.swift
//  BooKingApp
//
//  Created by Aziz on 13/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
    
    private var books: [Book] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(OpenBook.self, forCellWithReuseIdentifier: "OpenBook")
        view.backgroundColor = UIColor(red: 178 / 255, green: 155 / 255, blue: 104 / 255,alpha: 0.7)
        
        return view
    }()
    

    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red: 178 / 255, green: 155 / 255, blue: 104 / 255,alpha: 0.7)

        setupSubviews()
            }
                private func setupSubviews() {
                    view.addSubview(collectionView)
                
                let search = UISearchController(searchResultsController: nil)
                        search.searchResultsUpdater = self
                        self.navigationItem.searchController = search
                
                books.append(Book(image: "01", price: "1999 сом", author: " Emily Tesh", title: " Silver in the wood"))
                books.append(Book(image: "02", price: "1999 сом", author: " Robert De Niro", title: " Taxi Driver"))
                books.append(Book(image: "03", price: "1999 сом", author: " Eva Hofman ", title: " TIME"))
                books.append(Book(image: "04", price: "1999 сом", author: " Brian Carter", title: " A Black Fox Running"))
                books.append(Book(image: "05", price: "1999 сом", author: " Leif Gw Persson", title: " The Casual Optimist"))
                books.append(Book(image: "06", price: "1999 сом", author: " Kafka", title: " The Metamorfphosis"))
                books.append(Book(image: "07", price: "1999 сом", author: " Frank Herbert", title: " Dune"))
                books.append(Book(image: "08", price: "1999 сом", author: " Thomas S. Szasz", title: " The of Mental lllness"))
                books.append(Book(image: "09", price: "1999 сом", author: " Mathehew Olshan", title: " Marshlands"))
                books.append(Book(image: "10", price: "1999 сом", author: " W T Horton", title: " A Book Of Images"))
                books.append(Book(image: "11", price: "1999 сом", author: " Sir Robert's Ball", title: " The Story of the Sun"))
                books.append(Book(image: "12", price: "1999 сом", author: " Alfred W Rees", title: " The Girl of Ink & Stars"))
                books.append(Book(image: "13", price: "1999 сом", author: " C. I. Cooke", title: " Creatures Of The Hight"))
                books.append(Book(image: "14", price: "1999 сом", author: " Rudyard Kipling", title: " The Jungle Book"))
                books.append(Book(image: "15", price: "* сом", author: " RudYard Kipling ", title: " The Jungle Book-2"))
                books.append(Book(image: "16", price: "1999 сом", author: "Александр Пушкин", title: " The Lighthouse Witches"))
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let index = indexPath.row
        
        return CGSize(
            width: (view.frame.width / 1) - 20,
            height: (view.frame.height / 3) - 90
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OpenBook", for: indexPath) as! OpenBook
        let model = books[index]
        cell.photo.image = UIImage(named: model.photo)
             cell.price.text = String(model.price)
             cell.author.text = String(model.author)
             cell.title.text = String(model.title)
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    
    @objc(updateSearchResultsForSearchController:) func updateSearchResults(for searchController: UISearchController) {
            print(searchController.searchBar.text as Any )
        }
}

