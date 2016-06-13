//
//  ViewController.swift
//  ScrollExpand
//
//  Created by DonMag on 6/13/16.
//  Copyright © 2016 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	
	@IBOutlet weak var theScrollView: UIScrollView!
	
	var curSub = 1
	var nViews = 20
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		var y = 10	// padding between views
		
		for i in 1...nViews {
			
			let v = UIView(frame: CGRect(x: 20, y: y, width: 200, height: 100))
			v.backgroundColor = UIColor.redColor()
			
			let v1 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 90))
			v1.backgroundColor = UIColor.orangeColor()
			v1.tag = 101
			
			let v2 = UIView(frame: CGRect(x: 0, y: 90, width: 200, height: 10))
			v2.backgroundColor = UIColor.purpleColor()
			v2.tag = 102
			
			let lbl = UILabel(frame: CGRect(x: 8, y: 8, width: 160, height: 24))
			lbl.text = "View \(i)"
			
			v1.addSubview(lbl)
			
			v.addSubview(v1)
			v.addSubview(v2)
			
			v.tag = i
			
			theScrollView.addSubview(v)
			
			y = y + 110
			
		}
		
		theScrollView.contentSize = CGSizeMake(theScrollView.frame.width, CGFloat(y))
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func bTap10(sender: AnyObject) {
		for _ in 1...nViews {
			bTap(sender)
		}
	}
	
	@IBAction func bTap(sender: AnyObject) {
		
		let v = theScrollView.viewWithTag(curSub)
		let v2 = v?.viewWithTag(102)

		// increase the height of the "PostView"
		v?.frame.size.height += 43
		
		// increase teh height of the "subsection" view
		v2?.frame.size.height += 43
		
		// move all subsequent views down...
		for aView in theScrollView.subviews {
			
			if aView.tag > curSub {
				aView.frame.origin.y += 43
			}
			
		}
		
		if curSub < nViews {
			curSub += 1
		} else {
			curSub = 1
		}

		// increase the scrollView contentSize / height
		theScrollView.contentSize.height += 43
		
	}


	
}

