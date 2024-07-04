//
//  TasksTableViewHeader.swift
//  TaskyApp
//
//  Created by Edson Brandon on 03/07/24.
//

import UIKit

protocol TasksTableViewHeaderDelegate : AnyObject {
    func didTapAddTaskButton()
}

class TasksTableViewHeader: UIView {
    
    weak var delegate: TasksTableViewHeaderDelegate?
    // MARK:  - UI
    private lazy var headerLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Tarefas"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var addTaskButton : UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "plus")
        
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapAddTaskButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    @objc func didTapAddTaskButton() {
        delegate?.didTapAddTaskButton()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setHierarchy() {
        addSubview(headerLabel)
        addSubview(addTaskButton)
    }
    
    //MARK: - Contraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
}
