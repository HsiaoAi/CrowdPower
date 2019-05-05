//
//  ARViewController.swift
//  CrowdPower
//
//  Created by Hsiao Ai LEE on 2019/5/4.
//  Copyright © 2019 IFang Lee. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController, StoryboardInit {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var tapView: UIView!
    @IBAction func tapCloseButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnView))
        tapView.addGestureRecognizer(tapGesture)

        configureLighting()
        addCar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
        
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func tapOnView() {
        
        present(DetailViewController.storyboardInit(), animated: true)
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func addCar(x: Float = 0, y: Float = 0, z: Float = -0.5) {
       
        guard let carScene = SCNScene(named: "car.dae") else {
            return
            
        }
        let carNode = SCNNode()
        let carSceneChildNodes = carScene.rootNode.childNodes
        for childNode in carSceneChildNodes {
            carNode.addChildNode(childNode)
        }
        carNode.position = SCNVector3(x, y, z)
        carNode.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene.rootNode.addChildNode(carNode)
    }
}
