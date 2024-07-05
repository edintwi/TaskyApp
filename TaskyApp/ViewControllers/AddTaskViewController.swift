//
//  AddTaskViewController.swift
//  TaskyApp
//
//  Created by Edson Brandon on 04/07/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    private lazy var taskAddLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Adicionar tarefa"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var closeAddTaskButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "close.fill")
        
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Título"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var taskTitleTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Título da tarefa"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    private lazy var taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Descriçao"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var taskDescriptionTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Descriçao da tarefa"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    } ()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Salvar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        view.addSubview(taskAddLabel)
        view.addSubview(closeAddTaskButton)
        view.addSubview(taskTitleLabel)
        view.addSubview(taskTitleTextField)
        view.addSubview(taskDescriptionLabel)
        view.addSubview(taskDescriptionTextField)
        view.addSubview(addTaskButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            taskAddLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            taskAddLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeAddTaskButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            closeAddTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            taskTitleLabel.topAnchor.constraint(equalTo: taskAddLabel.bottomAnchor, constant: 20),
            taskTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            taskTitleTextField.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor, constant: 20),
            taskTitleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskTitleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskTitleTextField.bottomAnchor, constant: 20),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            taskDescriptionTextField.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor, constant: 20),
            taskDescriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskDescriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            addTaskButton.topAnchor.constraint(equalTo: taskDescriptionTextField.bottomAnchor, constant: 40),
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Navigation
    
    @objc func didTapSaveTaskButton() {
        
    }
}
