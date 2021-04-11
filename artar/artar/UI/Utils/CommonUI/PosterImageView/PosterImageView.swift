//
//  PosterImageView.swift
//  artar
//
//  Created by Prefect on 10.04.2021.
//

import Cocoa

open class PosterImageView : NSImageView {
    
    open override var image: NSImage? {
        set {
            
            layer = CALayer()
            layer?.contentsGravity = .resizeAspectFill
            layer?.contents = newValue
            layer?.cornerRadius = Design.MovieListVC.cornerRadius
            layer?.masksToBounds = true
            
            let shadow = NSShadow()
            shadow.shadowOffset = NSMakeSize(2, -2)
            shadow.shadowColor = NSColor.lightGray
            shadow.shadowBlurRadius = 3
            self.shadow = shadow
            
            wantsLayer = true
            
            
            super.image = newValue
        }
        
        get {
            return super.image
        }
        
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        if let sImage = image {
            self.image = sImage
        }
    }
    
}
