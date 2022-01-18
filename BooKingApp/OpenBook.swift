//
//  OpenBook.swift
//  BooKingApp
//
//  Created by Aziz on 13/1/22.
//

import Foundation
import UIKit
import SnapKit

class OpenBook: UICollectionViewCell {
    
    lazy var photo: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var author: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17)
        view.textColor = .darkGray
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 21, weight: .bold)
        view.numberOfLines = 0
        view.sizeToFit()
        return view
    }()
    
    lazy var price: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 25, weight: .bold)
        view.textColor = UIColor(red: 220 / 255, green: 190 / 255, blue: 59 / 255,alpha: 1)
        view.textAlignment = .right
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(photo)
        photo.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(170)
        }
        addSubview(author)
        author.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(photo.snp.right)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
        addSubview(title)
        title.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(author.snp.bottom)
            make.left.equalTo(photo.snp.right)
        }
        addSubview(price)
        price.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(5)
            make.left.equalTo(photo.snp.right)
            make.top.equalTo(title.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}
