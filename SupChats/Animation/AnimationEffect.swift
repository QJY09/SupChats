//
//  AnimationEffect.swift
//  SupChats
//
//  Created by QJY on 2019/3/9.
//  Copyright © 2019 QJY. All rights reserved.
//

import Foundation
import UIKit


//transform.rotation：旋转动画。
//transform.rotation.x：按x轴旋转动画。
//transform.rotation.y：按y轴旋转动画。
//transform.rotation.z：按z轴旋转动画。
//transform.scale：按比例放大缩小动画。
//transform.scale.x：在x轴按比例放大缩小动画。
//transform.scale.y：在y轴按比例放大缩小动画。
//transform.scale.z：在z轴按比例放大缩小动画。
//position：移动位置动画。
//opacity：透明度动画。


struct AnimationEffect{
    
    static func LineOf3DLoadingView(on ViewController:UIViewController,with IsShow:Bool){
        let ReplicatorLayer=CAReplicatorLayer()
        if IsShow==true{
            //Creat a Loading wait View
            ReplicatorLayer.bounds=CGRect(x: 0, y: 0, width: 100, height: 100)
            ReplicatorLayer.cornerRadius=20
            ReplicatorLayer.position=ViewController.view.center
            ReplicatorLayer.backgroundColor=UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.2).cgColor
            ReplicatorLayer.instanceDelay=1/3
            ViewController.view.layer.addSublayer(ReplicatorLayer)
            
            //Add Dot in the ReLicatorLayer
            let Dotlayer=CALayer()
            Dotlayer.bounds=CGRect(x: 0, y: 0, width: 15, height: 15)
            Dotlayer.position=CGPoint(x: 15, y: ReplicatorLayer.frame.size.height/2)
            Dotlayer.backgroundColor=UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.6).cgColor       
            Dotlayer.cornerRadius=7.5
            ReplicatorLayer.addSublayer(Dotlayer)
            //Setting the number of Dot in the Loading View
            ReplicatorLayer.instanceCount=3
            //Setting other dot in the Loading View By Transiform of direction X,Y,Z
            ReplicatorLayer.instanceTransform=CATransform3DMakeTranslation(ReplicatorLayer.frame.size.width/3, 0, 0)
            
            //Example of make a circle
            //        CGFloat count                     =  10.0;
            //        replicatorLayer.instanceCount     = count;
            //        CGFloat angel                     = 2* M_PI/count;
            //        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
            
            //Add Animation into Dot
            let DotAnimation=AnimationEffect.ConstructScaleAnimation(StartScale: 1, EndScale: 0, AnimationDuration: 1, Autoreverses: true, AnimationRepeatCount: kCFNumberPositiveInfinity as! Double)
            Dotlayer.add(DotAnimation, forKey: nil)
        }else{
            print("Close the LineOf3DLoadingView")
            
        }
    }
    
    
    static func ConstructOpacityAnimation(SartOpacity:CGFloat,EndOpacity:CGFloat,AnimationDuration:Double,AnimationRepeatCount:Double,Autoreverses:Bool)->CABasicAnimation{
        let OpacityAnimation = CABasicAnimation(keyPath: "opacity")
        OpacityAnimation.fromValue=SartOpacity
        OpacityAnimation.toValue=EndOpacity
        OpacityAnimation.duration=AnimationDuration
        OpacityAnimation.repeatCount=Float(AnimationRepeatCount)
        OpacityAnimation.autoreverses=Autoreverses
        return OpacityAnimation
        
    }
    
    static func ConstructAnimationPosition(StartPoint:CGPoint,EndPoint:CGPoint,AnimationDuration:Double,AnimationRepeatCount:Double,Autoreverses:Bool)->CABasicAnimation{
        let PositionAnimation=CABasicAnimation(keyPath: "position")
        PositionAnimation.fromValue = NSValue(cgPoint: StartPoint)
        PositionAnimation.toValue=NSValue(cgPoint: EndPoint)
        PositionAnimation.duration=AnimationDuration
        PositionAnimation.repeatCount=Float(AnimationRepeatCount)
        PositionAnimation.autoreverses=Autoreverses
       PositionAnimation.timingFunction=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return PositionAnimation
    }
    
    static func ConstructScaleAnimation(StartScale:CGFloat,EndScale:CGFloat,AnimationDuration:Double,Autoreverses:Bool,AnimationRepeatCount:Double)->CABasicAnimation{
        let ScaleAnimation=CABasicAnimation(keyPath: "transform.scale")
        ScaleAnimation.fromValue=StartScale
        ScaleAnimation.toValue=EndScale
        ScaleAnimation.duration=AnimationDuration
        ScaleAnimation.repeatCount=Float(AnimationRepeatCount)
        ScaleAnimation.autoreverses=Autoreverses
        return ScaleAnimation
    }
    
    static func ConstructRotationAnimation(AnimationDuration:Double,AnimationRepeatCount:Double)->CABasicAnimation{
        let RotationAnimation=CABasicAnimation(keyPath: "transform.rotation")
        RotationAnimation.fromValue=0
        RotationAnimation.toValue=Double.pi*2
        RotationAnimation.duration=AnimationDuration
        RotationAnimation.repeatCount=Float(AnimationRepeatCount)
        return RotationAnimation
    }
    
    
    static func Shake(with TextField:UITextField){
        let ShakeAnimation=CABasicAnimation(keyPath: "positon")
        ShakeAnimation.duration=0.1
        ShakeAnimation.repeatCount=2
        ShakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: TextField.center.x-4, y: TextField.center.y))
        ShakeAnimation.toValue=NSValue(cgPoint: CGPoint(x: TextField.center.x+4, y: TextField.center.y))
        TextField.layer.add(ShakeAnimation, forKey: "ShakeAnimation")
    }
    
    static func SpringAnimation(StartPoint:CGPoint,EndPoint:CGPoint,AnimationDuration:Double,AnimationDamping:Double)->CASpringAnimation{
        let SpringAnimation=CASpringAnimation(keyPath: "position")
        SpringAnimation.fromValue=StartPoint
        SpringAnimation.toValue=EndPoint
        SpringAnimation.duration=AnimationDuration
        SpringAnimation.damping=CGFloat(AnimationDamping)
        return SpringAnimation
    }
    
    
}


