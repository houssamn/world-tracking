//
//  ViewController.swift
//  World Tracking
//
//  Created by Houssam on 2/7/21.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    let configuration = ARWorldTrackingConfiguration()
    
    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        
        // Place randomly across x, y axes
        let x = randomNumbers(firstNum: 0.3, secondNum: -0.3)
        let y = randomNumbers(firstNum: 0.3, secondNum: -0.3)
        node.position = SCNVector3(x, y,-0.3)
        
        //Give the block a random rotation
        let rotX = randomNumbers(firstNum: -1, secondNum: 1)
        let rotY = randomNumbers(firstNum: -1, secondNum: 1)
        node.eulerAngles = SCNVector3(rotX, rotY, 0)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
     return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
