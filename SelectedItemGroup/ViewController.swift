//
//  ViewController.swift
//  SelectedItemGroup
//
//  Created by Pengpingjun on 2020/12/3.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ibButton: SelectItemButton!
    lazy var codeButton: SelectItemButton = {
        let button = SelectItemButton(type: .custom)
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        
        button.setTitle("codeButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setBoarderColor(.black, for: .normal)
        button.setBackgroundColor(.white, for: .normal)
        
        button.setTitleColor(.white, for: .selected)
        button.setBoarderColor(.red, for: .selected)
        button.setBackgroundColor(.yellow, for: .selected)

        return button
    }()

    var manager = SelectButtonsManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 数据源更新时，生成的tag跟数组index对应，codeButton.tag = 0, ibButton.tag = 1
        manager.items = [codeButton, ibButton]
        
        view.addSubview(codeButton)
        
        // 默认选中codebutton
        codeButton.sendActions(for: .touchUpInside)
    }
}

