//
//  StackedButton.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 8/13/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import UIKit
import SnapKit

@objc(OBAStackedButton)
public class StackedButton: UIControl {

    @objc
    public let textLabel: UILabel = {
        let label = UILabel.oba_autolayoutNew()
        label.numberOfLines = 2
        label.font = OBATheme.footnoteFont
        label.text = "LABEL"
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)

		if #available(iOS 13, *) {
			label.textColor = .label
		} else {
			label.textColor = .black
		}

        return label
    }()

    @objc
    public let imageView: UIImageView = {
        let imageView = UIImageView.oba_autolayoutNew()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.isUserInteractionEnabled = false

        return imageView
    }()
    
    override public var largeContentTitle: String? {
        get { return self.textLabel.text }
        set { /*empty*/ }
    }
    
    override public var largeContentImage: UIImage? {
        get { return self.imageView.image }
        set { /*empty*/ }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        isAccessibilityElement = true
        accessibilityTraits = .button
        isUserInteractionEnabled = true

        if #available(iOS 13, *) {
            showsLargeContentViewer = true
            scalesLargeContentImage = true
            backgroundColor = .secondarySystemFill
        } else {
            backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        }

        layer.cornerRadius = OBATheme.defaultCornerRadius

        let stack = UIStackView.oba_verticalStack(withArrangedSubviews: [imageView, textLabel])
        stack.isUserInteractionEnabled = false
        addSubview(stack)

        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: OBATheme.compactPadding, left: 0, bottom: OBATheme.compactPadding, right: 0))
        }
    }

    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
