//
//  CMExchangeComputer.swift
//  CMTextField
//
//  Created by CM on 2017/6/6.
//  Copyright © 2017年 CM. All rights reserved.
//

import UIKit

/**
 *  代理的标记
 */
enum DelegateFlags {
    case supportsShouldChangeTextInRange,supportsTextFieldShouldChangeCharactersInRange, supportsTextViewShouldChangeTextInRange,none
}


class CMExchangeComputer: UIView {

    //MARK: 成员变量
    @IBOutlet weak var viewSale: UIView!
    @IBOutlet weak var constraintViewSale: NSLayoutConstraint!
    @IBOutlet weak var switchBorrow: UISwitch!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var constraintViewPrice: NSLayoutConstraint!
    @IBOutlet weak var viewLine: UIView!

    @IBOutlet var button_0: UIButton!
    @IBOutlet var button_1: UIButton!
    @IBOutlet var button_2: UIButton!
    @IBOutlet var button_3: UIButton!
    @IBOutlet var button_4: UIButton!
    @IBOutlet var button_5: UIButton!
    @IBOutlet var button_6: UIButton!
    @IBOutlet var button_7: UIButton!
    @IBOutlet var button_8: UIButton!
    @IBOutlet var button_9: UIButton!
    @IBOutlet var button_dot: UIButton!
    @IBOutlet var button_hide: UIButton!
    @IBOutlet var button_del: UIButton!
    @IBOutlet var button_confirm: UIButton!
    @IBOutlet var cmPriceTF: UITextField!
    @IBOutlet var cmCountTF: UITextField!

    @IBOutlet weak var sliderExchange: UISlider!
    
    @IBOutlet weak var stackViewBase: UIStackView!
    @IBOutlet weak var constraintMainView: NSLayoutConstraint!
    @IBOutlet weak var stackViewLeftOne: UIStackView!
    @IBOutlet weak var stackViewLeftTwo: UIStackView!
    @IBOutlet weak var stackViewLeftThree: UIStackView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    
    var delegateSupportFlag: DelegateFlags = DelegateFlags.none
    var isInitial = false
    var keyboardButtons: [UIButton]!
        
    var keyboardHeight: CGFloat {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.height
        }
        
    }
    
    var keyboardWidth: CGFloat {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get {
            return self.frame.size.width
        }
        
    }
    
    var showType: String? 


    // 转入转出币
    typealias ButtonOperateCoinDoWhat = () -> Void
    var buttonOperateCoinDoWhat: ButtonOperateCoinDoWhat? {
        didSet {
            
        }
    }
    
   
    // 买入或卖出
    typealias ButtonExchangeDoWhat = () -> Void
    var buttonExchangeDoWhat: ButtonExchangeDoWhat? {
        didSet {
            
        }
    }
    
    // 收回键盘
    typealias ButtonDismissDoWhat = () -> Void
    var buttonDismissDoWhat: ButtonDismissDoWhat?
    
    
    var isHiddenViewBorrow = true {
        didSet {
            if isHiddenViewBorrow == true {
                self.viewPrice.isHidden = true
                self.constraintViewPrice.constant = 0
                constraintMainView.constant = 360 - 48
                self.viewLine.isHidden = false
                
            } else {
                self.viewPrice.isHidden = false
                self.constraintViewPrice.constant = 48
                constraintMainView.constant = 360
                self.viewLine.isHidden = true
                
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if !isInitial {
            
            //键盘按钮数组
            self.keyboardButtons = [
                button_0,
                button_1,
                button_2,
                button_3,
                button_4,
                button_5,
                button_6,
                button_7,
                button_8,
                button_9,
                button_dot,
                button_del,
                button_hide,
            ]
            
            isInitial = true
            
        }
        
        
    }

    /// 转入转出币
    @IBAction func handlePressOperateCoin(_ sender: UIButton) {
        buttonOperateCoinDoWhat?()
        
    }
    
    @IBAction func panSliderAction(_ sender: UISlider) {
        print(sender.value)
    }
    
    
    
    ///创建实例
    class func getInstance(showType: String, titlebuttonConfim: String,imageForButton_del: UIImage,thumbImageSlider: UIImage,imageIcon: UIImage,tintColor: UIColor, dismissViewDoWhat: @escaping ButtonDismissDoWhat,exchangeDoWhat: @escaping ButtonExchangeDoWhat) -> CMExchangeComputer {
        
        let cmExchangeComputer = UIView.loadFromNibNamed("CMExchangeComputer") as! CMExchangeComputer
        
        /****把键盘的inputView设为空，这样子就不会弹出原生视图的键盘****/
        cmExchangeComputer.cmCountTF.inputView = UIView()
        cmExchangeComputer.cmPriceTF.inputView = UIView()
        cmExchangeComputer.keyboardHeight = 360
        cmExchangeComputer.keyboardWidth = UIScreen.main.bounds.width
        cmExchangeComputer.buttonDismissDoWhat = dismissViewDoWhat
        cmExchangeComputer.buttonExchangeDoWhat = exchangeDoWhat
        cmExchangeComputer.backgroundColor = UIColor.clear
        cmExchangeComputer.stackViewBase.spacing = 0.5
        cmExchangeComputer.stackViewLeftOne.spacing = 0.5
        cmExchangeComputer.stackViewLeftTwo.spacing = 0.5
        cmExchangeComputer.stackViewLeftThree.spacing = 0.5
        cmExchangeComputer.setExchangeComputer(cmExchangeComputer: cmExchangeComputer, showType: showType,titlebuttonConfim: titlebuttonConfim, imageForButton_del: imageForButton_del, thumbImageSlider: thumbImageSlider, tintColor: tintColor)
        cmExchangeComputer.imageViewIcon.image = imageIcon
        return cmExchangeComputer
        
    }
    
    /**
     设置自定义键盘样式
     */
    func setExchangeComputer(cmExchangeComputer:CMExchangeComputer,showType: String,titlebuttonConfim: String,imageForButton_del: UIImage, thumbImageSlider: UIImage,tintColor: UIColor) {
        
        if showType == "buy" {
            
            /// 买入样式
            for buttonSingle in cmExchangeComputer.keyboardButtons {
                buttonSingle.setTitleColor(tintColor, for: UIControlState.normal)
                
            }
            cmExchangeComputer.button_confirm.backgroundColor = tintColor
            cmExchangeComputer.button_confirm.setTitle(titlebuttonConfim, for: .normal)
            cmExchangeComputer.sliderExchange.minimumTrackTintColor = tintColor
            cmExchangeComputer.sliderExchange.thumbTintColor = tintColor
            cmExchangeComputer.sliderExchange.setThumbImage(thumbImageSlider, for: .normal)
            cmExchangeComputer.showType = showType
            cmExchangeComputer.switchBorrow.onTintColor = tintColor
        } else {
            
            /// 卖出样式
            for buttonSingle in cmExchangeComputer.keyboardButtons {
                buttonSingle.setTitleColor(tintColor, for: UIControlState.normal)
            }
            cmExchangeComputer.button_confirm.backgroundColor = tintColor
            cmExchangeComputer.button_confirm.setTitle(titlebuttonConfim, for: .normal)
            cmExchangeComputer.showType = showType
            cmExchangeComputer.sliderExchange.minimumTrackTintColor = tintColor
            cmExchangeComputer.sliderExchange.thumbTintColor = tintColor
            cmExchangeComputer.sliderExchange.setThumbImage(thumbImageSlider, for: .normal)
            cmExchangeComputer.button_del.setImage(imageForButton_del, for: .normal)
            cmExchangeComputer.switchBorrow.onTintColor = tintColor
            
        }
    }
    
}

extension CMExchangeComputer {
    
    /**
     获取文本选择的范围
     
     - parameter textInput:
     
     - returns:
     */
    func selectedRange(_ textInput: UITextInput) -> NSRange {
        let textRange = textInput.selectedTextRange
        let startOffset = textInput.offset(from: textInput.beginningOfDocument, to: textRange!.start)
        let endOffset = textInput.offset(from: textInput.beginningOfDocument, to: textRange!.end)
        
        return NSMakeRange(startOffset, endOffset - startOffset);
    }
    
}

// MARK: - 按钮的功能
extension CMExchangeComputer {
    
    /**
     清除按钮
     */
    @IBAction func clearButtonPress(_ sender: UIButton?) {
        
        if self.cmPriceTF.isFirstResponder {
            self.clickClearKey(sender: sender!, tf: self.cmPriceTF)
        } else if self.cmCountTF.isFirstResponder {
            self.clickClearKey(sender: sender!, tf: self.cmCountTF)
        }

    }
    
    func clickClearKey(sender: UIButton,tf: UITextField) {
        
        switch self.delegateSupportFlag {
        case DelegateFlags.supportsShouldChangeTextInRange:
            var textRange = tf.selectedTextRange
            
            if (textRange?.start == textRange?.end) {
                let newStart = tf.position(from: textRange!.start, in: UITextLayoutDirection.left, offset: 1)
                textRange = tf.textRange(from: newStart!, to: textRange!.end)
            }
            
            if tf.shouldChangeText(in: textRange!, replacementText:"") {
                tf.deleteBackward()
            }
            break
        case DelegateFlags.supportsTextFieldShouldChangeCharactersInRange:
            var selectedRange = self.selectedRange(tf)
            if (selectedRange.length == 0 && selectedRange.location > 0) {
                selectedRange.location -= 1;
                selectedRange.length = 1;
            }
            let textField = tf
            if textField.delegate?.textField?(textField, shouldChangeCharactersIn: selectedRange, replacementString: "") ?? false {
                tf.deleteBackward()
            }
            break
        case DelegateFlags.supportsTextViewShouldChangeTextInRange:
            var selectedRange = self.selectedRange(tf)
            if (selectedRange.length == 0 && selectedRange.location > 0) {
                selectedRange.location -= 1;
                selectedRange.length = 1;
            }
//            let textView = tf as! UITextView
//            if textView.delegate?.textView?(textView, shouldChangeTextIn: selectedRange, replacementText: "") ?? false {
//                tf.deleteBackward()
//            }
//            break
        default:
            tf.deleteBackward()
        }

        
    }
    
    

    /**
     数字按钮点击
     
     - parameter sender:
     */
    @IBAction func numberButtonPress(_ sender: UIButton) {

        if self.cmPriceTF.isFirstResponder {
            
            self.clickNumberKey(sender: sender, tf: self.cmPriceTF)
            
        } else if self.cmCountTF.isFirstResponder {
        
            self.clickNumberKey(sender: sender, tf: self.cmCountTF)
            
        }

        
    }
    
    // 点击数字键盘
    func clickNumberKey(sender: UIButton,tf: UITextField) {
        if sender === self.button_dot {
            if tf.text!.contains(".") {    //如果包含小数.则不再输入
                return
            }
        }
        
        var selectedRange = self.selectedRange(tf)
        if (selectedRange.length == 0 && selectedRange.location > 0) {
            selectedRange.location -= 1;
            selectedRange.length = 1;
        }
        if tf.delegate?.textField?(tf, shouldChangeCharactersIn: selectedRange, replacementString: sender.titleLabel!.text!) ?? true {
            tf.insertText(sender.titleLabel!.text!)
        }

    }
    

    

    /**
     收回键盘按钮点击
     
     - parameter sender:
     */
    @IBAction func hideComputerKeyboard(_ sender: UIButton?) {
        buttonDismissDoWhat?()
    }
    
   
    @IBAction func handlePressExchange(_ sender: UIButton?) {
        buttonExchangeDoWhat?()
    }
    

    /// 开关
    @IBAction func handleSwitchBorrow(_ sender: UISwitch) {
        
        if sender.isOn {
            self.isHiddenViewBorrow = false
            
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.isHiddenViewBorrow = true
            }, completion: nil)
        }
        
    }
    
    
}


// MARK: - 扩展文本输入控制可返回ExchangeComputer
extension UITextField {
    
    var exchangeComputer: CMExchangeComputer? {
        if let computer = self.inputView as? CMExchangeComputer {
            return computer
        } else {
            return nil
        }
    }
}

extension UITextView {
    
    var exchangeComputer: CMExchangeComputer? {
        if let computer = self.inputView as? CMExchangeComputer {
            return computer
        } else {
            return nil
        }
    }
}

//MARK：全局方法
extension UIView {
    
    //读取nib文件
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}


