//
//  Loading.swift
//  MyFund
//
//  Created by wanghongqiang on 15/11/20.
//  Copyright © 2015年 ZhanHeng. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Foundation

class Loading: NSObject {
    
    static let frame = CGRectMake(0, 64, SCREEN_WIDTH(), SCREEN_HEIGHT() - 64 - 49)
    static let color = UIColor.greenColor()
    static let type = NVActivityIndicatorType.BallSpinFadeLoader
    static var loadingView = NVActivityIndicatorView(frame: frame, type: type, color: color, size: CGSizeMake(SCREEN_HEIGHT()/9.0, SCREEN_HEIGHT()/9.0))
    
    static func start() {
        loadingView.startAnimation()
    }
    
    static func stop() {
        loadingView.stopAnimation()
    }
    
    static func setNVActivityIndicatorView(controller: UIViewController){
        controller.view.addSubview(loadingView)
    }
}


// 类型 NVActivityIndicatorType
/*
case Blank
case BallPulse
case BallGridPulse
case BallClipRotate
case SquareSpin
case BallClipRotatePulse
case BallClipRotateMultiple
case BallPulseRise
case BallRotate
case CubeTransition
case BallZigZag
case BallZigZagDeflect
case BallTrianglePath
case BallScale
case LineScale
case LineScaleParty
case BallScaleMultiple
case BallPulseSync
case BallBeat
case LineScalePulseOut
case LineScalePulseOutRapid
case BallScaleRipple
case BallScaleRippleMultiple
case BallSpinFadeLoader
case LineSpinFadeLoader
case TriangleSkewSpin
case Pacman
case BallGridBeat
case SemiCircleSpin
*/