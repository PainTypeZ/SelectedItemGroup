//
//  SelectButtonsManager.swift
//  SelectedItemGroup
//
//  Created by Pengpingjun 2020/12/4.
//

import Foundation
// 选中button管理
class SelectButtonsManager: PTSelectableManager {
    typealias T = SelectItemButton
    
    var items: [T] = [] {
        didSet {
            /// 数据源更新时按顺序绑定tag和delegate
            items.enumerated().forEach {
                $0.element.tag = $0.offset
                $0.element.delegate = self
            }
        }
    }
    /// maxSelectedNumber == 1时单选，>1时多选，不允许小于1
    var maxSelectedNumber: Int = 1
    /// minSelectedNumber == 0 时，允许取消最后一个被选中的item
    var minSelectedNumber: Int = 0
    /// 选中的元素集合
    var selectedItems: [T] {
        return items.filter{ $0.isSelected }.compactMap{ $0 }
    }
}
// MARK: - SelectItemButtonDelegate
extension SelectButtonsManager: SelectItemButtonDelegate {
    /// 按钮点击事件代理
    /// - Parameter tag: button的tag
    func didTapped(tag: Int) {
        handleSelected(tag: tag, items: &items)
    }
}
