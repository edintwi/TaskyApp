//
//  TasksViewController.swift
//  TaskyApp
//
//  Created by Edson Brandon on 03/07/24.
//

import UIKit

protocol TaskDelegate : AnyObject {
    func didAddTask(newTask : Task)
}

class TasksViewController: UIViewController {
    
    private var taskyRepository: TaskyRepository
    
    private lazy var ilustrationImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.taskyIlustration))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 24
        
        let header = TasksTableViewHeader(frame:  .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        header.delegate = self
        tableView.tableHeaderView = header
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    
    private lazy var tasksEmptyLabel: UILabel = {
        let emptyLabel = UILabel(frame: .zero)
        emptyLabel.font = .systemFont(ofSize: 14, weight: .bold)
        emptyLabel.text = "Vamos começar o dia?"
        emptyLabel.isHidden = !taskyRepository.tasks.isEmpty
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        return emptyLabel
    } ()
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    init(taskRepository: TaskyRepository = TaskyRepository()) {
        self.taskyRepository = taskRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        setHierarchy()
        setupConstraints()
        setupNavigationBar()
        addGradientBackground()
    }
    
    private func setHierarchy() {
        view.addSubview(ilustrationImageView)
        view.addSubview(tableView)
        tableView.addSubview(tasksEmptyLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ilustrationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ilustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: ilustrationImageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            tasksEmptyLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            tasksEmptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func didTapCompleteTaskButton(_sender: UIButton) {
        guard let cell = _sender.superview as? UITableViewCell else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        taskyRepository.completeTaks(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskyRepository.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text =  taskyRepository.tasks[indexPath.row].title
        content.secondaryText = taskyRepository.tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckMarkButton(task: taskyRepository.tasks[indexPath.row])
        
        return cell
    }
    
    private func createTaskCheckMarkButton(task: Task ) -> UIButton {
        let completeButton = UIButton()
        completeButton.addTarget(self, action: #selector(didTapCompleteTaskButton), for: .touchUpInside)
        
        let symbolName = task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        
        completeButton.setImage(image, for: .normal)
        completeButton.frame = .init(x: 0, y: 0, width: 24, height: 24)
        
        return completeButton
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            taskyRepository.removeTask(at: indexPath.row)
            tasksEmptyLabel.isHidden = !taskyRepository.tasks.isEmpty
            tableView.reloadData()
        }
    }
}

extension TasksViewController: TasksTableViewHeaderDelegate {
     func didTapAddTaskButton() {
        let addTaskVC = AddTaskViewController()
         addTaskVC.delegate = self
        navigationController?.present(addTaskVC, animated: true)
    }
}

extension TasksViewController: TaskDelegate {
    func didAddTask(newTask: Task) {
        taskyRepository.addTask(newTask: newTask)
        tasksEmptyLabel.isHidden = !taskyRepository.tasks.isEmpty
        tableView.reloadData()
    }
}
 
