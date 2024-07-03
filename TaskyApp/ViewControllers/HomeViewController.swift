//
//  ViewController.swift
//  TaskyApp
//
//  Created by Edson Brandon on 02/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: AssetsConstants.logoDark)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    } ()
    
    private lazy var ilustrationImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: AssetsConstants.entryIlustration)
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var entryLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Prepare-se para conquistar o dia, \n uma lista de cada vez."
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.font = .systemFont(ofSize: 16, weight:.bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var getRedyButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Vamos começar!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(named: AssetsConstants.darkPurple)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(didTapGetReadyButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @objc func didTapGetReadyButton () {
        navigationController?.pushViewController(TasksViewController(), animated: true)
    }

    func setupView(){
        setHierarchy()
        setConstraints()
        addGradientBackground()
    }
    
    func setHierarchy(){
        view.addSubview(logoImageView)
        view.addSubview(ilustrationImageView)
        view.addSubview(entryLabel)
        view.addSubview(getRedyButton )
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ilustrationImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8.0),
            ilustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            entryLabel.topAnchor.constraint(equalTo: ilustrationImageView.bottomAnchor, constant: 32),
            entryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            entryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            entryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getRedyButton.topAnchor.constraint(equalTo: entryLabel.bottomAnchor, constant: 32),
            getRedyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getRedyButton.widthAnchor.constraint(equalToConstant: 162),
            getRedyButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

