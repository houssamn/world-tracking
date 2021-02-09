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
    }


}

