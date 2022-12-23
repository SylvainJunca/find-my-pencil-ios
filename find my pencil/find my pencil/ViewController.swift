//
//  ViewController.swift
//  find my pencil
//
//  Created by Sylvain Junca on 2022-12-22.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!
    struct Peripheral {
        var name: String
        var RSSI: NSNumber
        var advertisementData: [String : Any]
    }
    var peripherals = [Peripheral]()
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
            }
            else {
                print("Something wrong with BLE")
                // Not on, but can have different issues
            }

    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
       
        if let pname = peripheral.name {
            print(pname, RSSI)
            if let index = peripherals.firstIndex(where: { $0.name == pname
            }) {
                var periph = peripherals[index]
                periph.RSSI = RSSI
                peripherals[index] = periph
            } else {
                let periph = Peripheral(name: pname, RSSI: RSSI, advertisementData: advertisementData)
                peripherals.append(periph)
                
            }
            print(peripherals.count)
            
           
        }
        if let pdelegate = peripheral.services {
            print( pdelegate)
        }

    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue:nil)
    }


}

