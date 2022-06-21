//
//  HeaderMainView.swift
//  NewsNews
//
//  Created by  Mr.Ki on 02.05.2022.
//

import UIKit

class HeaderMainView: UIView {
    
//    lazy var newsPresenter = NewsPresenter(newsService: NewsService(), newsView: MainViewController())
    let mainVC = MainViewController()
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 150)
    }
    
    private func commonInit() {
        let bundle = Bundle(for: HeaderMainView.self)
        bundle.loadNibNamed("HeaderMainView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = appMainColor
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(contentViewConstraints)
    }
    
}




