//
//  TopicCollectionViewCell.swift
//  OurTopic
//
//  Created by 조우현 on 1/19/25.
//

import UIKit
import SnapKit
import Kingfisher

final class TopicCollectionViewCell: BaseCollectionViewCell {
    static let id = "TopicCollectionViewCell"
    
    private var photoImageView = UIImageView()
    private let starButton = UIButton()
    
    override func configureHierarchy() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(starButton)
    }
    
    override func configureLayout() {
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        starButton.snp.makeConstraints { make in
            make.leading.equalTo(photoImageView.snp.leading).offset(10)
            make.bottom.equalTo(photoImageView.snp.bottom).offset(-10)
            make.height.equalTo(28)
        }
    }
    
    override func configureView() {
        photoImageView.backgroundColor = .brown
        photoImageView.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.photoImageView.layer.cornerRadius = self.photoImageView.frame.width / 16
        }
        photoImageView.clipsToBounds = true
        
        starButton.setTitleColor(.white, for: .normal)
        starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        starButton.tintColor = .yellow
        starButton.layer.cornerRadius = 14
        starButton.backgroundColor = .starBackground
        starButton.configuration = .starButtonStyle()
        starButton.isUserInteractionEnabled = false
    }
    
    func configureData(data: PhotoDetail) {
        let formattedCount = NumberFormattingManager.shared.numberFormatting(number: data.likes)
        photoImageView.kf.setImage(with: URL(string: data.urls.thumb))
        starButton.setTitle("\(formattedCount ?? "")", for: .normal)
    }
}
