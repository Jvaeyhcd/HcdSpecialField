//
//  HcdSpecialField.swift
//  Pods
//
//  Created by Eddie Hiu-Fung Lau on 19/12/2016.
//
//

import UIKit

@IBDesignable
public class HcdSpecialField: UIControl, UIKeyInput {

    // MARK: - Public variables
    @IBInspectable public var numberOfDigits: Int = 6 {
        didSet {

            if oldValue != numberOfDigits {

                if inputNumber.characters.count > numberOfDigits {
                    let endOfString = inputNumber.index(inputNumber.startIndex, offsetBy: numberOfDigits)
                    inputNumber = inputNumber.substring(to: endOfString)
                }

                relayout()
                redisplay()
            }

        }
    }

    @IBInspectable public var inputNumber: String = "" {
        didSet {

            if oldValue != inputNumber {

                guard inputNumber.characters.count <= numberOfDigits else {
                    return
                }

                guard isNumeric(inputNumber) else {
                    return
                }

                redisplay()
                sendActions(for: .valueChanged)

            }
        }
    }

    @IBInspectable public var spaceBetweenDigits: CGFloat = 10.0 {

        didSet {

            if oldValue != spaceBetweenDigits {

                relayout()
                redisplay()

            }
        }

    }

    @IBInspectable public var dashColor: UIColor = UIColor.gray {
        didSet {

            if oldValue != dashColor {
                redisplay()
            }

        }
    }

    @IBInspectable public var textColor: UIColor = UIColor.black {
        didSet {
            if oldValue != textColor {
                redisplay()
            }
        }
    }

    @IBInspectable public var dashBackColor: UIColor = UIColor.green {
        didSet {
            if oldValue != dashBackColor {
                redisplay()
            }
        }
    }

    @IBInspectable public var backColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != backColor {
                redisplay()
            }
        }
    }
    
    @IBInspectable public var emptyDigit = "" {
        didSet {
            if oldValue != emptyDigit {
                redisplay()
            }
        }
    }

    // MARK: - Private variables
    private var numberLabels: [UILabel] = []
    private var isSecure = false {
        didSet {
            if isSecure != oldValue {
                redisplay()
            }
        }
    }


    // MARK: - UIView

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override public func layoutSubviews() {

        for index in 0..<numberLabels.count {
            let label = numberLabels[index]
            let frame = frameOfNumberLabel(ofDigitIndex: index)
            label.font = UIFont.systemFont(ofSize: frame.size.width * 0.9)
            label.frame = frame
        }

    }


    // MARK: - Private methods
    private func setup() {

        addTarget(self, action: #selector(HcdSpecialField.didTouchUpInside), for: .touchUpInside)
        relayout()

    }

    private func relayout() {
        numberLabels.forEach { label in
            label.removeFromSuperview()
        }
        numberLabels = []

        for _ in 0..<numberOfDigits {
            let numberLabel = UILabel()
            numberLabel.text = emptyDigit
            numberLabel.textColor = dashColor
            numberLabel.textAlignment = .center
            numberLabels.append(numberLabel)
            addSubview(numberLabel)
        }

        setNeedsLayout()

    }


    private func frameOfNumberLabel(ofDigitIndex index:Int) -> CGRect {

        let w = (bounds.size.width - spaceBetweenDigits * (CGFloat(numberOfDigits) - 1.0)) / CGFloat(numberOfDigits)
        let h = bounds.size.height
        let x = (w + spaceBetweenDigits) * CGFloat(index)
        let y = CGFloat(0)
        return CGRect(x:x, y:y, width:w, height:h)

    }

    private func redisplay() {

        for i in 0..<numberOfDigits {

            let label = numberLabels[i]

            if i < inputNumber.characters.count {

                let start = inputNumber.index(inputNumber.startIndex, offsetBy: i)
                let end = inputNumber.index(start, offsetBy: 1)
                let number = inputNumber.substring(with:start..<end)
                label.text = isSecureTextEntry ? "●" : number
                label.textColor = textColor
                label.backgroundColor = backColor

            } else {

                label.text = emptyDigit
                label.textColor = dashColor
                label.backgroundColor = dashBackColor
            }
        }

    }

    private func isNumeric(_ string:String) -> Bool {

        guard let regex = try? NSRegularExpression(pattern: "^[0-9]*$", options: []) else {
            return false
        }

        return regex.numberOfMatches(in: string, options: [], range: NSMakeRange(0, string.characters.count)) == 1
    }

    // MARK: - Handle the touch up event
    @objc private func didTouchUpInside() {
        becomeFirstResponder()
    }

    // MARK: UIKeyInput protocol
    public var hasText: Bool {
        return !inputNumber.isEmpty
    }

    public func insertText(_ text: String) {

        guard inputNumber.characters.count + text.characters.count <= numberOfDigits else {
            return
        }

        guard isNumeric(text) else {
            return
        }

        inputNumber = inputNumber + text
    }

    public func deleteBackward() {
        guard inputNumber.characters.count > 0 else {
            return
        }
        inputNumber = inputNumber.substring(to: inputNumber.index(before: inputNumber.endIndex))
    }

    public var isSecureTextEntry: Bool {
        @objc(isSecureTextEntry) get {
            return isSecure
        }
        @objc(setSecureTextEntry:) set {
            isSecure = newValue
        }
    }

    // MARK: UIResponder
    public override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: UIKeyboardTrait

    public var keyboardType: UIKeyboardType {
        set {}
        get {
            return .numberPad
        }
    }


}
