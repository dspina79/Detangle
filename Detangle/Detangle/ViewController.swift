//
//  ViewController.swift
//  Detangle
//
//  Created by Dave Spina on 4/13/21.
//

import UIKit

class ViewController: UIViewController {
    var currentLevel = 0
    var connections = [ConnectionView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        levelUp()
    }

    func levelUp() {
        currentLevel += 1
        connections.forEach{ $0.removeFromSuperview() }
        connections.removeAll()

        for _ in 1...(currentLevel + 4) {
            let connection = ConnectionView(frame: CGRect(origin: .zero, size: CGSize(width: 44, height: 44)))
            connection.backgroundColor = .white
            connection.layer.cornerRadius = 22
            connection.layer.borderWidth = 2
            connections.append(connection)
            
            view.addSubview(connection)
        }
        
        connections.forEach(place)
    }
    
    func place(_ connection: UIView) {
        let randomX = CGFloat.random(in: 20...view.bounds.maxX - 20)
        let randomY = CGFloat.random(in: 50...view.bounds.maxY - 50)
        
        connection.center = CGPoint(x: randomX, y: randomY)
    }

}

