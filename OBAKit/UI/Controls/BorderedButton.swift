//
//  BorderedButton.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 6/4/17.
//  Copyright © 2017 OneBusAway. All rights reserved.
//

import UIKit

@objc(OBABorderedButton)
public class BorderedButton: UIButton {

    @objc public var borderColor: UIColor = UIColor.black {
        didSet {
            configure()
        }
    }

    public override var intrinsicContentSize: CGSize {
        var sz = super.intrinsicContentSize
        sz.width += self.titleEdgeInsets.left + self.titleEdgeInsets.right
        sz.height += self.titleEdgeInsets.top + self.titleEdgeInsets.bottom

        return sz
    }

    @objc public convenience init(borderColor: UIColor, title: String) {
        self.init(frame: CGRect.zero)
        self.borderColor = borderColor
        self.configure()
        self.setTitle(title, for: .normal)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }

    func configure() {
        self.tintColor = borderColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4
        self.setTitleColor(self.borderColor, for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
}
