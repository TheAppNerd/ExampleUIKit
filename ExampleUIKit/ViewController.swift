//
//  ViewController.swift
//  ExampleUIKit
//
//  Created by Alexander Thompson on 4/5/2022.
//

import UIKit

class ViewController: UIViewController {

    //Create properties outside functions so they can be accessed from different functions.
    let label     = UILabel()
    let textField = UITextField()
    let button    = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //call all the funcs from view did load so they are all called when the view controller page loads
        setupLabel()
        setupTextField()
        setupButton()
        layoutUI()
    }

    
    func setupLabel() {
        label.textAlignment  = .center
        label.text           = ""
    }
    
    //textfields use delegates to access all their functionality so assign the view controller as the delegate
    func setupTextField() {
        textField.delegate = self
        textField.placeholder = "  Enter your name here"
        textField.backgroundColor = .lightGray
        
        //corner radius is how to round corners on items
        textField.layer.cornerRadius = 10
    }
    
    func setupButton() {
        button.backgroundColor = .systemBlue
            //buttons and other items can have certasin states you can use. 99% of the time you just use .normal.
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        //when adding targets to things you use #selector as an action which uses @objc funcs.
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    //objc funcs are required for target actions for some reason. its actually old objective c code.
    @objc func buttonPressed(sender: UIButton) {
        print("Button Pressed")
    }
    
    func layoutUI() {
        //for auto layout purposes all items you plan to add to layout need to be added to a subview
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        
        //All items being added to auto layout needed to have this set to fault or auto layout wont work.
        label.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        //This is the main way I do auto layout. trailing and bottom contraints need negative constants to work properly.
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

//Creating an extension to add delegates isnt 100% needed but is a clean way to have all your code in one place.
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        label.text = textField.text
    }

    
}

