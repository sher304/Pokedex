//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 22/12/23.
//

import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: Configurable
extension PokemonCollectionViewCell: Configurable {
    
    struct Model {
        let pokemonImage: String?
        let pokemonName: String?
    }
    
    func configure(with model: Model) {
//        self.pokemonImage = model.pokemonImage
        self.pokemonName.text = model.pokemonName
    }
}
