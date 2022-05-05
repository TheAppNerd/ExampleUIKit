//
//  SecondViewController.swift
//  ExampleUIKit
//
//  Created by Alexander Thompson on 5/5/2022.
//

import UIKit

class SecondViewController: UIViewController {

    var gameLabel = UILabel()
    var label     = UILabel()
    var randomNumber = Int()
    var buttonArray: [UIButton] = []
    var resetButton = UIButton()
    let mainStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        randomNumber = randomNumberGenerator()
        layoutStacks()
        configureButton()
        layoutLabels()
        layoutUI()
    }
    
    //Nested Stackviews. I used nested loops too.
    //so i create 8 stackviews and in stackview i create 5 buttons and add them to the stackview. I then add all these stackviews to the main stackview.
    func layoutStacks() {
        for _ in 0...7 {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            
            for _ in 0...4 {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.layer.borderWidth = 0
                button.layer.borderColor = UIColor.green.cgColor
                button.layer.cornerRadius = 10
                button.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
                //I append these buttons to a button array so I can easily manipulate them in other functions.
                buttonArray.append(button)
                stackView.addArrangedSubview(button)
            }
            mainStack.addArrangedSubview(stackView)
        }
        
        mainStack.axis = .vertical
        mainStack.spacing = 5
        mainStack.alignment = .fill
        mainStack.distribution = .fillEqually
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        //Enumerated arrays are handy to get the index number from any item in an array.
        for (index, button) in buttonArray.enumerated() {
            button.setTitle(String(index + 1), for: .normal)
        }
    }
    
    //Resets all button border widths to 0, runs the calcuilate func and changes the selected button border width.
    @objc func numberButtonPressed(sender: UIButton) {
        for button in buttonArray {
            button.layer.borderWidth = 0
        }
        if let number = Int(sender.title(for: .normal)!) {
        calculate(number: number)
        }
        sender.layer.borderWidth = 2
    }
    
    func layoutLabels() {
        gameLabel.text = "Guess The Correct Number!"
        gameLabel.font = UIFont.systemFont(ofSize: 30)
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Good Luck!"
    }
    
    func layoutUI() {
        view.addSubview(gameLabel)
        view.addSubview(label)
        view.addSubview(mainStack)
        view.addSubview(resetButton)
        
        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            gameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            gameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            gameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            label.topAnchor.constraint(equalTo: gameLabel.bottomAnchor,constant: padding),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            mainStack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            mainStack.heightAnchor.constraint(equalTo: mainStack.widthAnchor),
            
            resetButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: padding),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        

    }
    
    func configureButton() {
        resetButton.backgroundColor = .systemMint
        resetButton.setTitle("Reset Game", for: .normal)
        resetButton.layer.cornerRadius = 10
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
    }
    
    @objc func resetButtonPressed() {
        label.text = "Game Reset. Try Again"
        randomNumber = randomNumberGenerator()
        for button in buttonArray {
            button.layer.borderWidth = 0
        }
        
    }
    
    func randomNumberGenerator() -> Int {
        let randomNumber = Int.random(in: 0...39)
        return randomNumber
    }
    
    func calculate(number: Int) {
        if number > randomNumber {
            label.text = "Lower"
        } else if number < randomNumber {
            label.text = "Higher"
        } else {
            label.text = "Correct!"
        }
    }

}
