//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 21/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setScene(scene: windowScene)
    }
    
    private func setScene(scene: UIWindowScene) {
        self.window = UIWindow(frame: scene.coordinateSpace.bounds)
        self.window?.windowScene = scene
        let view = HomeAssembly.assemblyModule()
        let navigationController = UINavigationController(rootViewController: view)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

