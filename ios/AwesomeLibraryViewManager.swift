//
//  AwesomeLibraryViewManager.swift
//  AwesomeLibrary
//
//  Created by Gustavo Harff on 28/10/22.
//  Copyright © 2022 Facebook. All rights reserved.
//

@objc(AwesomeLibraryViewManager)
class AwesomeLibraryViewManager: RCTViewManager {

  override func view() -> (AwesomeLibraryView) {
    return AwesomeLibraryView()
  }

  @objc override static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

enum Section {
  case main
}

class AwesomeLibraryView : UIView {

  @objc var color: String = "" {
    didSet {
      self.backgroundColor = .green
    }
  }

  @objc var items: [String] = [] {
    didSet {
      populate(with: items)
    }
  }

  var dataSource: UICollectionViewDiffableDataSource<Section, String>?

  init() {
    super.init(frame: .zero)
    setupSubviews()
    setupCollectionView()
    populate(with: items)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  lazy var collectionView: UICollectionView = {
    let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
    let layout = UICollectionViewCompositionalLayout.list(using: configuration)

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .systemGroupedBackground

    return collectionView
  }()

  func setupSubviews() {
    addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  @objc var onPress: RCTBubblingEventBlock?

  @objc func tap(_ sender: UITapGestureRecognizer) {

   let location = sender.location(in: self.collectionView)
   let indexPath = self.collectionView.indexPathForItem(at: location)

    if let index = indexPath {
      onPress!(["text": items[index[1]], "index": index[1]])
   }
}

  func setupCollectionView() {
    let registration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, indexPath, item in
      var content = cell.defaultContentConfiguration()
      content.text = item
      cell.contentConfiguration = content
      cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
    }

    dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: collectionView) { collectionView, indexPath, item in
      collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
    }
  }

  func populate(with items: [String]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
    snapshot.appendSections([.main])
    snapshot.appendItems(items)
    dataSource?.apply(snapshot)
  }
}
