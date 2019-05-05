//
//  ARExtensions.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/5.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit
import ARKit
import Alamofire

extension SCNNode {
    
    // This solved flickering issue.
    func renderOnTop() {
        self.renderingOrder = 2
        if let geom = self.geometry {
            for material in geom.materials {
                material.readsFromDepthBuffer = false
            }
        }
        for child in self.childNodes {
            child.renderOnTop()
        }
    }
}

extension UIColor {
    
    // swiftlint:disable all
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
        
    }
    // swiftlint:enable all
}

extension CALayer {
    
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        xPosition: CGFloat = 0,
        yPosition: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: xPosition, height: yPosition)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dxValue = -spread
            let rect = bounds.insetBy(dx: dxValue, dy: dxValue)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension UITableView {
    
    func scrollToBottom() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self else { return }
            
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection: self.numberOfSections-1)-1,
                section: self.numberOfSections-1
            )
            
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

extension UIView {
    
    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func anchor(
        top: NSLayoutYAxisAnchor?,
        leading: NSLayoutXAxisAnchor?,
        bottom: NSLayoutYAxisAnchor?,
        trailing: NSLayoutXAxisAnchor?,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
        ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
