//
//  Untitled.swift
//  SOPT38-seminar
//
//  Created by 초긍정행운의포춘쿠키 on 4/25/26.
//


import UIKit
import SnapKit
import Then

class ItemViewController: UIViewController, UICollectionViewDelegate {
    
    
    final let lineSpacing: CGFloat = 10
    final let interItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let inset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var itemList = ItemModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setCollectionViewLayout()
        register()
        setDelegate()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout(){
        collectionView.snp.makeConstraints{$0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        let cellWidth = doubleCellWidth / 2
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = lineSpacing
        flowLayout.minimumInteritemSpacing = interItemSpacing
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func register() {
        collectionView.register(ItemViewCell.self, forCellWithReuseIdentifier: ItemViewCell.identifier)
    }
    
    private func setDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemViewCell.identifier, for: indexPath) as? ItemViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}

extension ItemViewController: ItemCollectionViewCellDelegate {
    func heartButtonDidTap(cell: ItemViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        itemList[indexPath.item].heartIsSelected.toggle()
        cell.heartButton.isSelected.toggle()
    }
}
