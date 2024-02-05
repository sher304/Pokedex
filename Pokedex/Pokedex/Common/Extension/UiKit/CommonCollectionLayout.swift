//
//  CommonCollectionLayout.swift
//  Pokedex
//
//  Created by Шермат Эшеров on 22/12/23.
//

import UIKit

final class CommonCollectionFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {}

  init(itemSize: CGSize, lineSpacing: CGFloat, interitemSpacing: CGFloat, scrollDirection: UICollectionView.ScrollDirection) {
    super.init()
    self.itemSize = itemSize
    self.scrollDirection = scrollDirection
    self.minimumLineSpacing = lineSpacing
    self.minimumInteritemSpacing = interitemSpacing
  }

    @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
