//
//  ClockButton.swift
//  FrogClock
//
//  Created by Robert Dodson on 2/24/19.
//  Copyright © 2019 Robert Dodson. All rights reserved.
//

import UIKit

class ClockButton: UIButton
{
    var secondHand:UIBezierPath
    var smallHand:UIBezierPath
    var bigHand:UIBezierPath
    var thecenter:CGPoint
    var width:CGFloat
    var height:CGFloat
    
    required init?(coder: NSCoder)
    {
        secondHand = UIBezierPath()
        smallHand = UIBezierPath()
        bigHand = UIBezierPath()
        thecenter = CGPoint()
        width = CGFloat()
        height = CGFloat()
        
        super.init(coder: coder)
        
        
        let ringwidth:CGFloat = 3.0
        width = self.frame.width
        height = self.frame.height
        thecenter = CGPoint(x: width / 2.0,y:height / 2.0)
        
        let secondslength = (width / 2.0) - ringwidth - 30
        let smalllength = (width / 2.0) - ringwidth - 65
        let biglength = (width / 2.0) - ringwidth - 35
        
        secondHand.move(to: CGPoint(x: thecenter.x, y: thecenter.y))
        secondHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y - 1.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x + (secondslength - 25.0), y: thecenter.y - 1.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x + (secondslength - 20.0), y: thecenter.y - 3.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x + secondslength, y: thecenter.y))
        secondHand.addLine(to: CGPoint(x: thecenter.x + (secondslength - 20.0), y: thecenter.y + 3.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x + (secondslength - 25.0), y: thecenter.y + 1.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y + 1.0))
        secondHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y))
        secondHand.close()
        
        
        smallHand.move(to: CGPoint(x: thecenter.x, y: thecenter.y))
        smallHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y - 1.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x + (smalllength - 45.0), y: thecenter.y - 1.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x + (smalllength - 30.0), y: thecenter.y - 7.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x + smalllength, y: thecenter.y))
        smallHand.addLine(to: CGPoint(x: thecenter.x + (smalllength - 30.0), y: thecenter.y + 7.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x + (smalllength - 45.0), y: thecenter.y + 1.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y + 1.0))
        smallHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y))
        smallHand.close()
        
        
        bigHand.move(to: CGPoint(x: thecenter.x, y: thecenter.y))
        bigHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y - 1.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x + (biglength - 45.0), y: thecenter.y - 1.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x + (biglength - 30.0), y: thecenter.y - 5.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x + biglength, y: thecenter.y))
        bigHand.addLine(to: CGPoint(x: thecenter.x + (biglength - 30.0), y: thecenter.y + 5.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x + (biglength - 45.0), y: thecenter.y + 1.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y + 1.0))
        bigHand.addLine(to: CGPoint(x: thecenter.x, y: thecenter.y))
        bigHand.close()
        
    }
    
    
    override func draw(_ rect: CGRect)
    {
        let color = UIColor(displayP3Red: 0.1, green: 0.9, blue: 0.1, alpha: 1.0)
        let handcolor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.00)
        
        
        //
        // Ring
        //
        let ringwidth:CGFloat = 3.0
        let startAngle:Float = 0.0
        let endAngle:Float = 360.0
        
        let path = UIBezierPath(arcCenter: thecenter,
                                radius: (width / 2.0) - ringwidth,
                                startAngle: startAngle.degreesToRadians,
                                endAngle:endAngle.degreesToRadians,
                                clockwise: true)
        
        color.setStroke()
        path.lineWidth = ringwidth;
        path.stroke()
        
       
        //
        // seconds ticks
        //
        let tickstart_r = (width / 2.0) - ringwidth - 10
        let tickend_r = (width / 2.0) - ringwidth
        for second in 0...59
        {
            let tickstart = DegreesToPoint(degrees: CGFloat(second * 6), radius: tickstart_r, origin: thecenter)
            let tickend = DegreesToPoint(degrees: CGFloat(second * 6), radius: tickend_r, origin: thecenter)
            
            let tick = UIBezierPath()
            tick.move(to: tickstart)
            tick.addLine(to: tickend)
            tick.close()
            tick.lineWidth = 1.0;
            tick.stroke()
        }
      
        
        //
        // hours ticks
        //
        let tickstart_h_r = (width / 2.0) - ringwidth - 15
        let tickend_h_r = (width / 2.0) - ringwidth
        for hour in 0...12
        {
            let tickstart = DegreesToPoint(degrees: CGFloat(hour * 30), radius: tickstart_h_r, origin: thecenter)
            let tickend = DegreesToPoint(degrees: CGFloat(hour * 30), radius: tickend_h_r, origin: thecenter)
            
            let tick = UIBezierPath()
            tick.move(to: tickstart)
            tick.addLine(to: tickend)
            tick.close()
            tick.lineWidth = 2.0;
            color.setStroke()
            tick.stroke()
        }
        
        
        //
        // numbers
        //
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let number_attr: [NSAttributedString.Key : Any] = [
            .paragraphStyle: paragraphStyle,
            .font:  UIFont.systemFont(ofSize:12.0),
            .foregroundColor: color]
        
        let fontpos_r = (width / 2.0) - ringwidth - 25
        for hour in 1...12
        {
            let string = String(hour)
            
            let fontpoint = DegreesToPoint(degrees:CGFloat(hour * 30), radius: fontpos_r, origin: thecenter)
            let fontbox = CGRect(x:fontpoint.x - 7.5,y:fontpoint.y - 7.5,width:15.0,height:15.0)
            string.draw(in:fontbox, withAttributes: number_attr)
        }
        
        
        //
        // Get time
        //
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        
        //
        // big hand
        //
        let copiedBigHand = bigHand.copy() as! UIBezierPath
        let angleBig = (360 + 90) - Float(minute * 6)
        drawHand(path: copiedBigHand, angle: angleBig, color: handcolor, fill:true)
        
        
        //
        // Small hand
        //
        let hm = CGFloat(minute) / 60
        let ffhm = (hour * 5) + Int(5 * hm);
        let copiedSmallHand = smallHand.copy() as! UIBezierPath
        let angleSmall = (360 + 90) - Float(ffhm * 6)
        drawHand(path: copiedSmallHand, angle: angleSmall, color: handcolor, fill:true)
        
        
        //
        // second hand
        //
        let copiedPath = secondHand.copy() as! UIBezierPath
        let angle = (360 + 90) - Float(second * 6)
        drawHand(path: copiedPath, angle: angle, color: UIColor.purple, fill:true)
        
    }
    
    //
    // Draw a hand. Rotate then translate back to the center of clock face.
    //
    func drawHand(path:UIBezierPath, angle:Float, color:UIColor, fill:Bool)
    {
        let copiedHand = path.copy() as! UIBezierPath
        let rotate = CGAffineTransform.init(rotationAngle:-angle.degreesToRadians)
        copiedHand.apply(rotate)
        let currpnt = copiedHand.currentPoint
        let translate = CGAffineTransform.init(translationX: thecenter.x - currpnt.x, y: thecenter.y - currpnt.y)
        copiedHand.apply(translate)
        
        if (fill)
        {
            color.setFill()
            copiedHand.fill()
        }
        else
        {
            color.setStroke()
            copiedHand.stroke()
        }
    }


}



extension Float
{
    var degreesToRadians : CGFloat
    {
        return CGFloat(self) * CGFloat(Double.pi) / 180.0
    }
}



func DegreesToPoint(degrees:CGFloat, radius:CGFloat, origin:CGPoint) -> CGPoint
{
    var xy = CGPoint()
    
    let radians = ((360 + 90) - degrees) * CGFloat.pi / 180.0;
    
    xy.x = cos(radians) * radius + origin.x;
    xy.y = sin(-radians) * radius + origin.y;
    
    return xy;
}

