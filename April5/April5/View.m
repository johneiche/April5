//
//  View.m
//  April5
//
//  Created by John Eiche on 4/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        //self.backgroundColor = [UIColor yellowColor];
        self.backgroundColor = [UIColor colorWithRed: 0.0 green: 0.73 blue: 0.83 alpha: 1.0]; // 
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    UIFont *font = [UIFont systemFontOfSize: 32.0];
    NSString *string = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint:");
    CGPoint point = CGPointMake(0.0, 0.0);
    [string drawAtPoint: point withFont: font];
    NSLog(@"The localized greeting = %@", string);
    
    /*
     NSLocale *locale = [NSLocale currentLocale];
     
     NSString *displayNameString = [locale
     displayNameForKey:NSLocaleIdentifier
     value:[locale localeIdentifier]];
     // localeLabel.text = displayNameString;
     NSLog(@"Locale = %@", displayNameString);
     NSLog(@"displayNameForKey = %@", locale.localeIdentifier);
     
     */ 
    
    // Drawing code
    
    NSString *german = @"Hallo Welt";
    NSString *french = @"Bonjour tout le monde";
    //NSString *string3 = @"Hella World";
    
    //draw the French flag.
    if ([string isEqualToString: french]) {  
        NSLog(@"string1 is equal to string2");
        
        CGSize size = self.bounds.size;
        CGFloat min = MIN(size.width, size.height);
        CGFloat longSide = min * 15 / 16;
        CGFloat shortSide = longSide * 2 / 3;
        
        CGContextRef c = UIGraphicsGetCurrentContext();
        CGContextBeginPath(c);
        
        CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
        CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
        
        CGFloat stripeLongSide = shortSide;
        CGFloat stripeShortSide = longSide / 3;
        
        CGRect horizontal = CGRectMake(-stripeShortSide / 2, -stripeLongSide / 2, stripeShortSide, stripeLongSide);
        CGContextAddRect(c, horizontal);
        
        CGContextSetRGBFillColor(c, 1.0, 1.0, 1.0, 1.0); // white
        CGContextFillPath(c);
        
        CGContextTranslateCTM(c, -stripeShortSide, 0); // move width of one stripe left  
        CGContextAddRect(c, horizontal);    
        CGContextSetRGBFillColor(c, 0.0, 0.14, 0.58, 1.0); // blue
        CGContextFillPath(c);
        
        CGContextTranslateCTM(c, stripeShortSide * 2, 0); // move width of two stripes right 
        CGContextAddRect(c, horizontal); 
        CGContextSetRGBFillColor(c, 0.93, 0.16, 0.22, 1.0); // red
        CGContextFillPath(c);
    };
    // draw the german flag
    if ([string isEqualToString: german]) {  
        NSLog(@"string1 is equal to string2");
        // Drawing code
        //draw the German flag.
        CGSize size = self.bounds.size;
        CGFloat min = MIN(size.width, size.height);
        CGFloat longSide = min * 15 / 16;
        CGFloat shortSide = longSide * 3 / 5;
        
        CGContextRef c = UIGraphicsGetCurrentContext();
        CGContextBeginPath(c);
        
        CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
        CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
        
        
        CGFloat stripeLongSide = longSide;
        CGFloat stripeShortSide = shortSide / 3;
        
        CGRect horizontal = CGRectMake(-stripeLongSide / 2, -stripeShortSide / 2, stripeLongSide, stripeShortSide);
        CGContextAddRect(c, horizontal);
        
        
        CGContextSetRGBFillColor(c, 0.87, 0.0, 0.0, 1.0); // red
        CGContextFillPath(c);
        
        CGContextTranslateCTM(c, 0, -stripeShortSide ); // move height of one stripe down    
        CGContextAddRect(c, horizontal);    
        CGContextSetRGBFillColor(c, 1.0, 0.81, 0.0, 1.0); // gold
        CGContextFillPath(c);
        
        CGContextTranslateCTM(c, 0, stripeShortSide * 2 ); // move height of two stripes up  
        CGContextAddRect(c, horizontal); 
        CGContextSetRGBFillColor(c, 0, 0, 0, 1.0); // black
        CGContextFillPath(c);
        
    };
    
}

@end
