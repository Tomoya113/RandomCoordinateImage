//
//  RandomCoordinateViewController.swift
//  SwiftPlayground
//
//  Created by tomoya tanaka on 2020/11/20.
//

import UIKit

class RandomCoordinateViewController: UIViewController {
	
	var safeAreaTop: Double!
	var safeAreaBottom: Double!
	override func viewDidLayoutSubviews() {
		safeAreaTop = Double(self.view.safeAreaInsets.top)
		safeAreaBottom = Double(self.view.safeAreaInsets.bottom)
	}
	
	var generateImageTimer = Timer()
	override func viewDidLoad() {
		super.viewDidLoad()
		generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIIMageView), userInfo: nil, repeats: true)
	}

	@objc func generateUIIMageView() -> Void {
		
		// 表示したい画像の名前のリスト
		let imageList: [String] = ["cat", "skyfish", "slime"]
		
		let randomImageElement = imageList.randomElement()!
		// UIImageの初期化
		let image: UIImage = UIImage(named: randomImageElement)!
		image.accessibilityIdentifier = randomImageElement
		// UIImageViewの初期化
		let imageView = UIImageView(image: image)
		
		// 画面の縦幅・横幅を取得
		let viewWidth: CGFloat = view.frame.size.width
		let viewHeight: CGFloat = view.frame.size.height - CGFloat(safeAreaBottom)

		// 画像に設定したい縦・横幅を変数に格納
		let imageWidth: CGFloat = 100
		let imageHeight: CGFloat = 100

		// 画像の座標・大きさを生成
		let rect: CGRect = CGRect(x: CGFloat.random(in: 0...viewWidth - 30), y: CGFloat.random(in: CGFloat(safeAreaTop)...viewHeight), width: imageWidth, height: imageHeight)
		

		// 指定した座標・大きさを設定
		imageView.frame = rect;

		
		imageView.isUserInteractionEnabled = true
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			imageView.removeFromSuperview()
		}
		// viewにUIImageViewを追加
		self.view.addSubview(imageView)
	}
	
	@objc func imageViewTapped(sender: UITapGestureRecognizer) {
		let view = sender.view as! UIImageView
		sender.view?.removeFromSuperview()
		let identifier = view.image?.accessibilityIdentifier!
		switch identifier {
		case "cat":
			print("ねこ")
		case "skyfish":
			print("スカイフィッシュ")
		case "slime":
			print("スライム")
		default:
			print("???")
		}
		
	}

}
