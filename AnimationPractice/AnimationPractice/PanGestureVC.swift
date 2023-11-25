//
//  PanGestureVC.swift
//  AnimationPractice
//
//  Created by Gahyun Kim on 2023/11/25.
//

import UIKit

import SnapKit
import Then

class PanGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setLayout()
        
    }
    
    private func setLayout() {
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: imageView) //imageView의 이동값을 가져오기 위해 Transition tjsdjs
        //원래의 imageView 센터 좌표의 x, y값과 더해줘서 해당 이미지 뷰가 이동할 위치
        let changedX = imageView.center.x + transition.x
        let changedY = imageView.center.y + transition.y
        //imageView의 Center 값으로 교체해줌
        self.imageView.center = .init(x: changedX,
                                     y: changedY)
        //sender.setTranslation(.zero, in: imageView)
    }
    
    
    private lazy var imageView = UIImageView(image: UIImage(named: "roopy")).then {
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
    }

}
