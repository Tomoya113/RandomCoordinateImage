//
//  ViewController.swift
//  SwiftPlayground
//
//  Created by tomoya tanaka on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let label = UILabel(frame: .zero)
		label.text = "テキスト"
		label.textColor = .black
		label.frame = CGRect(x: view.bounds.width / 2, y:  300, width: 150, height: 100)
		label.center = CGPoint(x: view.bounds.width / 2, y: 300)
		label.textAlignment = .center
		let image = UIImage(named: "Pepsized_Blur_30")!
		let resizedImage = image.resized(toWidth: label.bounds.width)
		label.backgroundColor = UIColor(patternImage: resizedImage!)
		
		print(label.frame)
		view.self.addSubview(label)
	}


}

extension UIImage {
	func resized(toWidth width: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: width, height: CGFloat(ceil(width / size.width * size.height)))
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
		defer { UIGraphicsEndImageContext() }
		draw(in: CGRect(origin: .zero, size: canvasSize))
		return UIGraphicsGetImageFromCurrentImageContext()
	}
}
