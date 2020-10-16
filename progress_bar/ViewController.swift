//
//  ViewController.swift
//  progress_bar
//
//  Created by Yuki Shinohara on 2020/10/16.
//

import UIKit

class ViewController: UIViewController {
    
    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    private let progressView : UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .link
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(progressView)
        
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 55)
        button.center = view.center
        progressView.frame = CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 20)
        progressView.setProgress(0, animated: false)
    }
    
    @objc private func didTapButton() {
        for x in 0...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(x) * 0.25)) { [weak self] in
                self?.progressView.setProgress(Float(x) / 100, animated: true)
            }
        }
    }
    
    
}

