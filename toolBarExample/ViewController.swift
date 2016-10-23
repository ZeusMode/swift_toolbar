//
//  ViewController.swift
//  toolBarExample
//
//  Created by Wesley Cintra Nascimento on 19/10/16.
//  Copyright © 2016 Wesley Cintra Nascimento. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Estados da view
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleTimer(_ sender: AnyObject) {
        if swiftTimer.isValid {
            stopTimer(self)
        } else {
            startTimer(self)
        }
    }

    // MARK: - Propriedades
    var swiftTimer = Timer()
    var swiftCounter = 0
    
    // MARK: - Outlets
    @IBOutlet weak var countingLabel: UILabel!

    
    @IBAction func startTimer(_ sender: AnyObject) {
        
        // Para invalidar timers anteriores
        swiftTimer.invalidate()
        
        // Configurar o timer
        swiftTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func clearTimer(_ sender: UIBarButtonItem) {
        swiftTimer.invalidate()
        
        swiftCounter = 0
        countingLabel.text = String(swiftCounter)
    }
    
    @IBAction func stopTimer(_ sender: AnyObject) {
        
        swiftTimer.invalidate()
    }
    
    // MARK: - Funções de apoio
    func updateCounter() {
        swiftCounter += 1
        countingLabel.text = String(swiftCounter)
    }
    
}

