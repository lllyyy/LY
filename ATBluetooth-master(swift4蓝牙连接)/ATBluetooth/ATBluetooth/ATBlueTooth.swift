//
//  ATBlueTooth.swift
//  ATBluetooth
//
//  Created by ZGY on 2017/11/13.
//Copyright © 2017年 macpro. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2017/11/13  下午4:27
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

class ATBlueTooth: ATBlueToothSuper {
    
    private var atCentral:ATCentral?
    override var delegate:ATContextDelegate? {
        
        didSet {
            atCentral?.delegate = delegate as? ATCentralDelegte
        }
        
    }
    
    open static let `default`: ATBlueTooth = {

        return ATBlueTooth()
    }()
    

    override init() {
        super.init()
        atCentral = ATCentral()
    }
    
    override func startScanForDevices(advertisingWithServices services: [String]? = nil) {
        super.startScanForDevices(advertisingWithServices: services)
        atCentral?.scanBlock = { [weak self]() in
            
            self?.atCentral?.startScanForDevices(advertisingWithServices: services)
            
        }
    }
    
    override func stopScan() {
        super.stopScan()
        atCentral?.stopScan()
    }
    
    override func connect(_ device:ATBleDevice?) {
        super.connect(device)
        atCentral?.connect(device)
    }
    
    override func disconnectDevice(_ device: ATBleDevice?) {
        super.disconnectDevice(device)
        atCentral?.disconnectDevice(device)
    }
    
    override func reconnectDevice(_ uuidString:String?) {
        super.reconnectDevice(uuidString)
        atCentral?.reconnectDevice(uuidString)
    }
    
    override func writeData(_ data:Data,type:ATCharacteristicWriteType = .withResponse,block:writeResult = nil) {
        super.writeData(data, type: type, block: block)
        atCentral?.writeData(data, type: type, block: block)
        
    }
    

}
