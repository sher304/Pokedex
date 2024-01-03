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
    private lazy var parentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pokeball")
        return imageView
    }()
    
    private lazy var pokemonName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Draw
    private func setupConstraints() {
        contentView.addSubview(parentView)
        parentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.top.equalToSuperview()
        }
        
        parentView.addSubview(pokemonImage)
        pokemonImage.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.size.equalTo(50)
        }
        
        parentView.addSubview(pokemonName)
        pokemonName.snp.makeConstraints {
            $0.top.equalTo(pokemonImage.snp.bottom).offset(8)
            $0.centerX.equalTo(pokemonImage)
        }
    }
}


// MARK: Configurable
extension PokemonCollectionViewCell: Configurable {
    struct Model {
        let pokemonName: String?
    }
    
    func configure(with model: Model) {
        self.pokemonName.text = model.pokemonName?.capitalized
    }
}
