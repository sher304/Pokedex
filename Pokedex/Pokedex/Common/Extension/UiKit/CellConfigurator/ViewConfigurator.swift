//
//  ViewConfigurator.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 23/12/23.
//

import UIKit

protocol ViewConfigurator {
    static var reuseId: String { get }
    
    func configure(cell: UIView)
    func associatedValue<T>() -> T?
}


// MARK: ViewConfigurator 
protocol TableCellConfiguratorProtocol: ViewConfigurator {
    var cellHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
}


// MARK: TableCellConfiguratorProtocol
extension TableCellConfiguratorProtocol {
    var cellType: UITableViewCell.Type? {
        let className = String(reflecting: Self.self)
        let typeName = className.components(separatedBy: ".").last ?? ""
        return NSClassFromString(typeName) as? UITableViewCell.Type
    }
}


// MARK: ViewConfigurator
protocol CollectionCellConfiguratorProtocol: ViewConfigurator {
    var size: CGSize { get }
}

