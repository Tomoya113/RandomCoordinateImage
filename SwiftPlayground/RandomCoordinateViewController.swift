//
//  RandomCoordinateViewController.swift
//  SwiftPlayground
//
//  Created by tomoya tanaka on 2020/11/20.
//

import UIKit

class RandomCoordinateViewController: UIViewController {
	
	// セーフエリアを格納する用の変数
	var safeAreaTop: Double!
	var safeAreaBottom: Double!
	override func viewDidLayoutSubviews() {
		// デバイスのセーフエリアを取得する
		safeAreaTop = Double(self.view.safeAreaInsets.top)
		safeAreaBottom = Double(self.view.safeAreaInsets.bottom)
	}
	
	// タイマーを設定
	var generateImageTimer = Timer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// タイマーを起動
		generateImageTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(generateUIIMageView), userInfo: nil, repeats: true)
	}

	@objc func generateUIIMageView() -> Void {
		
		// 表示したい画像の名前のリスト
		let imageList: [String] = ["cat", "skyfish", "slime"]
		
		// 配列からランダムな名前を取り出す
		let randomImageElement = imageList.randomElement()!
		
		// UIImageの初期化
		let image: UIImage = UIImage(named: randomImageElement)!
		
		// 画像が押された時用に識別子を設定
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

		// ユーザーのタップなどを認識するように設定！
		imageView.isUserInteractionEnabled = true
		
		// タップされたときに呼ばれる関数を登録
		imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped)))
		
		// 1秒後に画像が消えるように設定！
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			imageView.removeFromSuperview()
		}
		// viewにUIImageViewを追加
		self.view.addSubview(imageView)
	}
	
	// ボタンが押されたときの処理
	@objc func imageViewTapped(sender: UITapGestureRecognizer) {
		// タップ元を取得&識別子を取得
		let view = sender.view as! UIImageView
		let identifier = view.image?.accessibilityIdentifier!
		
		// タップされたときに消える！
		sender.view?.removeFromSuperview()
		
		// 上で設定した識別子に合わせてコンソールに出力する文字列を変えるSwitch文！
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
