//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 22/12/23.
//

import UIKit
import Kingfisher

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Draw
    private func setupConstraints() {
        contentView.addSubview(pokemonImage)
        pokemonImage.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.leading.equalTo(20)
            $0.size.equalTo(50)
        }
        
        contentView.addSubview(pokemonName)
        pokemonName.snp.makeConstraints {
            $0.top.equalTo(pokemonImage.snp.bottom).offset(10)
            $0.centerX.equalTo(pokemonImage)
        }
    }
}


// MARK: Configurable
extension PokemonCollectionViewCell: Configurable {
    
    struct Model {
        let pokemonImage: String?
        let pokemonName: String?
    }
    
    func configure(with model: Model) {
        self.pokemonImage.kf.setImage(with: URL(string: model.pokemonImage ?? ""))
        self.pokemonName.text = model.pokemonName?.capitalized
    }
}
