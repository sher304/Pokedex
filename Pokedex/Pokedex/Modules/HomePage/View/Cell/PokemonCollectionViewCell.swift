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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
