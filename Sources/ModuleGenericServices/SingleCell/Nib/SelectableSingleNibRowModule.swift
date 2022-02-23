//
//  SelectableSingleNibRowModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SelectableSingleNibRowModule<Cell: ConfigurableCell, Decorator: RowSelectableProtocol>:
    ConfigurableSingleNibRowModule<Cell, Decorator> {
    open weak var delegate: SelectableSingleNibRowModuleDelegate?
    
    open override func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let element = decorator?.element else { return }
        delegate?.selectableSingleNibRowModule(self, didSelectElement: element)
    }
}

// MARK: - SelectableSingleNibRowModuleDelegate
public protocol SelectableSingleNibRowModuleDelegate: AnyObject {
    func selectableSingleNibRowModule<Cell: ConfigurableCell, Decorator: RowSelectableProtocol>
            (_ module: SelectableSingleNibRowModule<Cell, Decorator>, didSelectElement element: Any)
}
