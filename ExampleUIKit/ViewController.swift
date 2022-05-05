//
//  ViewController.swift
//  ExampleUIKit
//
//  Created by Alexander Thompson on 4/5/2022.
//

import UIKit

class ViewController: UIViewController {

    let label     = UILabel()
    let textField = UITextField()
    let button    = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
        setupTextField()
        setupButton()
        layoutUI()
    }

    func setupLabel() {
        label.textAlignment  = .center
        label.text           = ""
    }
    
    func setupTextField() {
        textField.delegate = self
        textField.placeholder = "  Enter your name here"
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 10
    }
    
    func setupButton() {
        button.backgroundColor = .systemBlue
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        print("Button Pressed")
    }
    
    func layoutUI() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        label.text = textField.text
    }

    
}

