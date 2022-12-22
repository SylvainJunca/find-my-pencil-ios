//
//  ViewController.swift
//  find my pencil
//
//  Created by Sylvain Junca on 2022-12-22.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            print("BLE powered on")
                // Turned on
            }
            else {
                print("Something wrong with BLE")
                // Not on, but can have different issues
            }
        
    }
    
    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue:nil)
    }


}

