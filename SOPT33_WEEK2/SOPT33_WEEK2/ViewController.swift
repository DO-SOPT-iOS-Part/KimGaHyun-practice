//
//  ViewController.swift
//  SOPT33_WEEK2
//
//  Created by Gahyun Kim on 2023/10/14.
//

import UIKit

class ViewController: UIViewController {

    

    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width / 2
    
    
    private func setLayout() {
            self.view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                         scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                         scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                         scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)])
            
            NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                         contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                         contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
                                         contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
            contentViewHeight.priority = .defaultLow
            contentViewHeight.isActive = true
            
            
            [playergreen, playerblue].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview($0)
            }
            
            
            NSLayoutConstraint.activate([playergreen.topAnchor.constraint(equalTo: self.contentView.topAnchor),
                                         playergreen.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                         playergreen.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                         playergreen.heightAnchor.constraint(equalToConstant: 800)])
            
            NSLayoutConstraint.activate([playerblue.topAnchor.constraint(equalTo: self.playergreen.bottomAnchor),
                                         playerblue.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                                         playerblue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
                                         playerblue.heightAnchor.constraint(equalToConstant: 800),
                                         playerblue.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)])
    }
    
    

    private var contentView : UIView = {
        let contentview = UIView()
        return contentview
    }()
    
    private var scrollView : UIScrollView = {
        let scrollview = UIScrollView()
        return scrollview
    }()
    
    private var playerblack : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .black
        //view.layer.cornerRadius = 10
        view.clipsToBounds  = true
        return view
    }()
    

    private var playergreen : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .green
        //view.layer.cornerRadius = 10
        view.clipsToBounds  = true
        return view
    }()
    

    private var playerblue : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .blue
        //view.layer.cornerRadius = 10
        view.clipsToBounds  = true
        return view
    }()
    

    private var playeryellow : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .yellow
        //view.layer.cornerRadius = 10
        view.clipsToBounds  = true
        return view
    }()
    
    
    private var white1 : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .white
        view.clipsToBounds  = true
        return view
    }()
    
    private var white2 : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .white
        view.clipsToBounds  = true
        return view
    }()
    
    private var white3 : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .white
        view.clipsToBounds  = true
        return view
    }()
    
    private var white4 : UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 30, height: 30)))
        view.backgroundColor = .white
        view.clipsToBounds  = true
        return view
    }()
    

    private lazy var stackView_left: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playeryellow,white1, playerblack, white2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var stackView_right: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [white3, playergreen, white4, playerblue])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setLayout()
    }

    
}

