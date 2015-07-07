//
//  InterfaceController.swift
//  WKHapticSample WatchKit Extension
//
//  Created by koogawa on 2015/07/07.
//  Copyright © 2015年 Kosuke Ogawa. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var hapticTable: WKInterfaceTable!

    let hapticTypes = [
        "Notification"  : WKHapticType.Notification,
        "DirectionUp"   : WKHapticType.DirectionUp,
        "DirectionDown" : WKHapticType.DirectionDown,
        "Success"       : WKHapticType.Success,
        "Failure"       : WKHapticType.Failure,
        "Retry"         : WKHapticType.Retry,
        "Start"         : WKHapticType.Start,
        "Stop"          : WKHapticType.Stop,
        "Click"         : WKHapticType.Click,
    ]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        reloadTableData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - Private method
    private func reloadTableData() {

        hapticTable.setNumberOfRows(hapticTypes.count, withRowType:"RowController")

        for (index, hapticName) in hapticTypes.keys.enumerate() {
            let row = hapticTable.rowControllerAtIndex(index) as! RowController
            row.nameLabel.setText(hapticName)
            row.hapticType = hapticTypes[hapticName]
        }
    }

    // MARK: - WKInterfaceTable
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let row = hapticTable.rowControllerAtIndex(rowIndex) as! RowController
        let hapticType = row.hapticType!
        WKInterfaceDevice.currentDevice().playHaptic(hapticType)
    }

}
