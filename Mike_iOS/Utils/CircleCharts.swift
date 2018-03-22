//
//  CircleCharts.swift
//  Mike_iOS
//
//  Created by Jordan Vacca on 21/03/2018.
//  Copyright © 2018 JeremyP. All rights reserved.
//

import Foundation
import UIKit

class CircleGraph
{
    var shapeLayer: CAShapeLayer!
    var pulsatingLayer: CAShapeLayer!
    var pompe: CGFloat = 0.0
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    func setupCG(View: UIView)
    {
        pulsatingLayer = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.pulsatingFillColor, View: View)
        View.layer.addSublayer(pulsatingLayer)
        animatePulsatingLayer()
        
        let trackLayer = createCircleShapeLayer(strokeColor: .trackStrokeColor, fillColor: UIColor.clear,  View: View)
        View.layer.addSublayer(trackLayer)
        
        shapeLayer = createCircleShapeLayer(strokeColor: .outlineStrokeColor, fillColor: .clear, View: View)
        
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeEnd = 0
        View.layer.addSublayer(shapeLayer)
    }
    
    
    
     func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, View: UIView) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = kCALineCapRound
        layer.position = View.center
        return layer
    }
    
    func setupPercentageLabel(View: UIView) {
        View.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = View.center
    }
    
    func pompeCounter()
    {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = pompe / 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        pompe += 0.1
        shapeLayer.strokeEnd = pompe
        //shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    func animatePulsatingLayer()
    {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.3
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
  //  @objc  func handleTap() {
    //    print("Attempting to animate stroke")
        
        //   beginDownloadingFile()
        
      //  animateCircle()
    //}
    
}
