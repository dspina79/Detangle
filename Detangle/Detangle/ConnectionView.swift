//
//  ConnectionView.swift
//  Detangle
//
//  Created by Dave Spina on 4/13/21.
//

import UIKit

class ConnectionView: UIView {
    var dragChanged: (() -> Void)?
    var dragFinished: (() -> Void)?
    var touchStart = CGPoint.zero
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        touchStart = touch.location(in: self)
        
        touchStart.x -= frame.width / 2
        touchStart.y -= frame.height / 2
        
        transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: superview)
        
        center = CGPoint(x: point.x - touchStart.x, y: point.y - touchStart.y)
        dragChanged?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        transform = .identity
        dragFinished?()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
}
