//
//  WrappedImageTextView.swift
//  WrappedImageTextView
//
//  Created by 박상우 on 2022/10/10.
//

import UIKit
import SnapKit

class WrappedImageTextView: UIView {
    enum ImageAlign {
        case left
        case right
    }
    
    private let imageView = UIImageView()
    private let textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = .systemFont(ofSize: 16)
        textView.textColor = .black
        textView.isEditable = false
        return textView
    }()
    private let imageSize: CGSize
    private let align: ImageAlign
    
    init(image: UIImage?, align: ImageAlign, imageSize: CGSize, text: String) {
        self.imageSize = imageSize
        self.align = align
        super.init(frame: .zero)

        imageView.image = image
        
        var bezierPath = UIBezierPath()
        switch align {
        case .left:
            bezierPath = UIBezierPath(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: imageSize))
        case .right:
            bezierPath = UIBezierPath(rect: CGRect(origin: CGPoint(x: UIScreen.main.bounds.width - 40 - 40 - imageSize.width, y: 0), size: imageSize))
        }
        textView.textContainer.exclusionPaths = [bezierPath]
        textView.text = text
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(textView)
        addSubview(imageView)
        
        textView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            switch align {
            case .left:
                make.leading.equalToSuperview()
            case .right:
                make.trailing.equalToSuperview()
            }
            
            make.width.equalTo(imageSize.width)
            make.height.equalTo(imageSize.height)
        }
    }
}
