//
//  HomeAssembly.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import UIKit

final class HomeAssembly {
    
    static func assemblyModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let router = HomeRouter()
        let pokemonService = PokemonServiceImpl(networkService: NetworkService<PokemonEndPoint>())
        let interactor = HomeInteractor(PokemonService: pokemonService)
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
