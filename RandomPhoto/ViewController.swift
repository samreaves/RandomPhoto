//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Samuel Reaves on 9/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        getRandomPhoto()
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 20, y: view.frame.size.height - 150 - view.safeAreaInsets.bottom, width: view.frame.size.width - 40, height: 55)
    }
    
    func getRandomPhoto() {
        let urlString: String = "https://source.unsplash.com/random/600x600"
        guard let url = URL(string: urlString) else { return }
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        imageView.image = UIImage(data: data)
    }
}

