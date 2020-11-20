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
		
		// 背景画像に設定したい画像を定義
		let image = UIImage(named: "Pepsized_Blur_30")!
		
		// ラベルの大きさに画像を調整！
		let resizedImage = image.resized(toWidth: label.bounds.width)
		
		// ラベルの背景に画像を設定！
		label.backgroundColor = UIColor(patternImage: resizedImage!)
//
//		print(label.frame)
//		view.self.addSubview(label)
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
