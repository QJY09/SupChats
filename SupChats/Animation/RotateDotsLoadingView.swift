//
//  RotateDotsLoadingView.swift
//  SupChats
//
//  Created by QJY on 2019/3/12.
//  Copyright © 2019 QJY. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //  make a function to add view with animation
    //
    // - Parameters:
    //   - Title: describe text
    //   - Enable: additional actions can be or not performed during loading
    func MakeRotateBallLoading(Title: String? = "", Enable: Bool = false) {
        // Loading Basic View
        var RoatationView: BallRoatationView?
        var needInitRoatationView = true
        var needInitCoverView = true
        var needInitTitleView = true
        subviews.forEach { (view) in
            if view.tag == 10001 {
                needInitRoatationView = false
            }
            if view.tag == 10002 {
                needInitCoverView = false
            }
            if view.tag == 10003 {
                needInitTitleView = false
            }
        }
        if needInitRoatationView {
            RoatationView = BallRoatationView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        }
        guard let RoatationBallView = RoatationView else {
            return
        }
        RoatationBallView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        RoatationBallView.tag = 10001
        addSubview(RoatationBallView)
        bringSubview(toFront: RoatationBallView)
        RoatationBallView.backgroundColor = UIColor.clear
        
        // If there are string in the View
        if Title != nil && !Title!.isEmpty && needInitTitleView {
            let fontSize:CGFloat = 16
            let strSize = (Title! as NSString).boundingRect(with: CGSize(width: bounds.width - 50, height: 15), options: [], attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size
            
            let TitleView = UIView(frame: CGRect(x: 0, y: 0, width: strSize.width > 100 ? strSize.width + 25 : 100, height: 80))
            TitleView.backgroundColor = UIColor.groupTableViewBackground
            TitleView.clipsToBounds = true
            TitleView.layer.cornerRadius = 10
            TitleView.center =  CGPoint(x: bounds.width / 2, y: bounds.height / 2)
            addSubview(TitleView)
            bringSubview(toFront: TitleView)
            TitleView.tag = 10003
            
            RoatationBallView.removeFromSuperview()
            RoatationBallView.center = CGPoint(x: TitleView.bounds.width / 2, y: 20)
            TitleView.addSubview(RoatationBallView)
            
            //  Add Title in the view
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: strSize.width, height: 20))
            label.text = Title
            label.font = UIFont.systemFont(ofSize: fontSize)
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            TitleView.addSubview(label)
            label.center = CGPoint(x: TitleView.bounds.width / 2, y: TitleView.bounds.height - 18)
        }
        
        //  If can't be click, it will add a cover view
        if !Enable {
            if needInitCoverView {
                let CoverView = UIControl(frame: bounds)
                CoverView.isEnabled = true
                CoverView.tag = 10002
                addSubview(CoverView)
                bringSubview(toFront: CoverView)
            }
        }
    }
    
    
    // Remove the Loading Animation
    func DismissBallRotationLoading(){
        subviews.forEach { (view) in
            if view.tag == 10001 {
                view.removeFromSuperview()
            }
            if view.tag == 10002 {
                view.removeFromSuperview()
            }
            if view.tag == 10003 {
                view.removeFromSuperview()
            }
        }
    }
}

class BallRoatationView: UIView {
    // MARK: - Private Properties
    //  Initail Colour of Each Ball
    private let FirstBallColor = UIColor(red: 255 / 255.0, green: 120 / 255.0, blue: 120 / 255.0, alpha: 1.0)
    private let SecondBallColor = UIColor(red: 255 / 255.0, green: 217 / 255.0, blue: 81 / 255.0, alpha: 1.0)
    private let ThirdBallColor = UIColor(red: 87 / 255.0, green: 200 / 255.0, blue: 255 / 255.0, alpha: 1.0)
    // Initail the Radius of Ball
    private let BallRadiusDefault: CGFloat = 8
    // Initail Radius of animaiton
    private let AnimationDistanceDefault: CGFloat = 30
    // Setting the Animation Durtion
    private let AnimationDurtionDefault: TimeInterval = 1.2
    
    // Setting Radius
    private var radius: CGFloat = 0
    // Setting the Time of Aniamtion
    private var animationDurtion: TimeInterval = 0
    // The distance of path
    private var distance: CGFloat = 0
    // CenterPoint
    private var centerPoint = CGPoint(x: 0, y: 0)
    // First Ball Layer
    lazy var FirstBallLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = bounds
        layer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        return layer
    }()
    // Second Ball Layer
    private lazy var SecondBallLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = bounds
        layer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        return layer
    }()
    // Third Ball Layer
    private lazy var ThirdBallLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = bounds
        layer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        return layer
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        // Initail Progress
        initProgressBar()
        // Setting the Ball Colour for each
        setBallColor(firstColor: FirstBallColor, secondColor: SecondBallColor, thirdColor: ThirdBallColor)
        // Setting the Radius
        setBallRadius(radius: BallRadiusDefault)
        // Setting Radius of animaiton
        setAnimatonDistance(distance: AnimationDistanceDefault)
        // Setting the time of Animation
        setAnimationDurtion(durtion: AnimationDurtionDefault)
        // Start Animaiton
        startAnimation()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Initail progress
    private func initProgressBar() {
        animationDurtion = AnimationDurtionDefault
        radius = BallRadiusDefault
        distance = AnimationDistanceDefault
        centerPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // Add three ball layers
        layer.addSublayer(FirstBallLayer)
        layer.addSublayer(SecondBallLayer)
        layer.addSublayer(ThirdBallLayer)
    }
    
    
    // Setting the ball colour
    func setBallColor(firstColor: UIColor, secondColor: UIColor, thirdColor: UIColor) {
        FirstBallLayer.fillColor = firstColor.cgColor
        SecondBallLayer.fillColor = secondColor.cgColor
        ThirdBallLayer.fillColor = thirdColor.cgColor
    }
    
    // MARK: - Public Methods
    // Setting the radius for Animation of each Ball
    func setBallRadius(radius: CGFloat) {
        self.radius = radius
        FirstBallLayer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        SecondBallLayer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        ThirdBallLayer.path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
    }
    

    
    // Setting the Animation Time
    func setAnimationDurtion(durtion: TimeInterval) {
        self.animationDurtion = durtion
    }
    
    // Set the radius of the ball Distance
    func setAnimatonDistance(distance: CGFloat) {
        self.distance = distance
        if distance > bounds.width || distance < 4 {
            self.distance = bounds.width / 2
        }
    }
    
    // Start Animation Function
    func startAnimation() {
        stopAnimation()
        
        startOneBallAnimation()
        startTwoBallAnimation()
        startThreeBallAnimation()
    }
    
    // End Animaiton Function
    func stopAnimation() {
        // Remove All Animation of each Layers
        FirstBallLayer.removeAllAnimations()
        SecondBallLayer.removeAllAnimations()
        ThirdBallLayer.removeAllAnimations()
    }
    

    // start the first Ball Animation
    private func startOneBallAnimation() {
        // Rotation Animation of the ball
        let transformation = CAKeyframeAnimation(keyPath: "transform.translation.z")
        transformation.values = [0, 1, 0, 0]
        
        // The first ball displacement animation
        let oneFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath.init()
        path.move(to:  CGPoint(x: centerPoint.x - distance, y: centerPoint.y))
        path.addLine(to: CGPoint(x: centerPoint.x, y: centerPoint.y))
        path.addLine(to:  CGPoint(x: centerPoint.x + distance, y: centerPoint.y))
        path.addLine(to:  CGPoint(x: centerPoint.x - distance, y: centerPoint.y))
        oneFrameAnimation.path = path
        oneFrameAnimation.keyTimes = [0, 0.333333, 0.666666, 1.0] as [NSNumber]
        
        // Scale Animation of the ball
        let oneScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        oneScaleAnimation.values = [0.7, 1.2, 0.7, 0.7]
        
        // Opacity Animation of the ball
        let oneOpactiyAniamtion = CAKeyframeAnimation(keyPath: "opacity")
        
        // Combination of animation
        let FirstAnimationGroup = CAAnimationGroup()
        FirstAnimationGroup.animations = [transformation, oneFrameAnimation, oneScaleAnimation, oneOpactiyAniamtion]
        FirstAnimationGroup.duration = self.animationDurtion
        FirstAnimationGroup.repeatCount = HUGE
        FirstBallLayer.add(FirstAnimationGroup, forKey: "FirstAnimationGroup")
    }
    
    // start the Second Ball Animation
    private func startTwoBallAnimation() {
        // Rotation Animation of the ball
        let transformation = CAKeyframeAnimation(keyPath: "transform.translation.z")
        transformation.values = [1, 0, 0, 1]
        
        // The Second ball displacement animation
        let twoFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath.init()
        path.move(to: centerPoint)
        path.addLine(to: CGPoint(x: centerPoint.x + distance, y: centerPoint.y))
        path.addLine(to: CGPoint(x: centerPoint.x - distance, y: centerPoint.y))
        path.addLine(to: centerPoint)
        twoFrameAnimation.path = path
        twoFrameAnimation.keyTimes = [0, 1.0 / 3, 2.0 / 3, 1.0] as [NSNumber]
        
        // Scale Animation of the ball
        let twoScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        twoScaleAnimation.values = [1.0, 0.7, 0.7, 1.0]
        
        // Opacity Animation of the ball
        let twoOpactiyAniamtion = CAKeyframeAnimation(keyPath: "opacity")
        
        // Combination of animation
        let SecondAnimationGroup = CAAnimationGroup()
        SecondAnimationGroup.animations = [transformation, twoFrameAnimation, twoScaleAnimation, twoOpactiyAniamtion]
        SecondAnimationGroup.duration = self.animationDurtion
        SecondAnimationGroup.repeatCount = HUGE
        SecondBallLayer.add(SecondAnimationGroup, forKey: "SecondAnimationGroup")
    }
    
    // start the Third Ball Animation
    private func startThreeBallAnimation() {
        // Rotation Animation of the ball
        let transformation = CAKeyframeAnimation(keyPath: "transform.translation.z")
        transformation.values = [0, 0, 1, 0]
        
        // The Third ball displacement animation
        let threeFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = CGMutablePath.init()
        path.move(to: CGPoint(x: centerPoint.x + distance, y: centerPoint.y))
        path.addLine(to: CGPoint(x: centerPoint.x - distance, y: centerPoint.y))
        path.addLine(to: centerPoint)
        path.addLine(to: CGPoint(x: centerPoint.x + distance, y: centerPoint.y))
        threeFrameAnimation.path = path
        threeFrameAnimation.keyTimes = [0, 1.0 / 3, 2.0 / 3, 1.0] as [NSNumber]
        
        // Scale Animation of the ball
        let threeScaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        threeScaleAnimation.values = [0.7, 0.7, 1.0, 0.7]
        
        // Opacity Animation of the ball
        let threeOpactiyAniamtion = CAKeyframeAnimation(keyPath: "opacity")
        
        // Combination of animation
        let ThirdAnimationGroup = CAAnimationGroup()
        ThirdAnimationGroup.animations = [transformation, threeFrameAnimation, threeScaleAnimation, threeOpactiyAniamtion]
        ThirdAnimationGroup.duration = self.animationDurtion
        ThirdAnimationGroup.repeatCount = HUGE
        ThirdBallLayer.add(ThirdAnimationGroup, forKey: "ThirdAnimationGroup")
    }
}
