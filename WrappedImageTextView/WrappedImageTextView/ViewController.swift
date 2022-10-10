//
//  ViewController.swift
//  WrappedImageTextView
//
//  Created by 박상우 on 2022/10/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let wrappedImageTextView = WrappedImageTextView(image: UIImage(named: "flower"),
                                                            align: .left,
                                                            imageSize: CGSize(width: 200, height: 200),
                                                            text: "dsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlwdsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlwdsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlwdsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlwdsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlwdsadfwerqwersadfknvihiwlearnilasnfkdlnewklrnkqlw"
    )
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(wrappedImageTextView)
        
        wrappedImageTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
    }

}

