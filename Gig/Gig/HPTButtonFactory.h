//
//  HPTButtonFactory.h
//  Hipstr
//
//  Created by Tyler Hedrick on 9/30/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HPTButtonType) {
  HPTButtonTypeLogin,
  HPTButtonTypeSignup
};

@interface HPTButtonFactory : NSObject

+ (UIButton *)buttonWithType:(HPTButtonType)type title:(NSString *)title;

@end
