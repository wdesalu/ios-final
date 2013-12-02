//
//  HPTButtonFactory.m
//  Hipstr
//
//  Created by Tyler Hedrick on 9/30/13.
//  Copyright (c) 2013 hedrick.tyler. All rights reserved.
//

#import "HPTButtonFactory.h"
#import <QuartzCore/QuartzCore.h>

@implementation HPTButtonFactory

+ (UIButton *)buttonWithType:(HPTButtonType)type title:(NSString *)title
{
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setTitle:title forState:UIControlStateNormal];
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
  
  button.titleLabel.font = [UIFont systemFontOfSize:26];
  button.layer.cornerRadius = 4.0;
  
  switch (type) {
    case HPTButtonTypeLogin:
      [button setBackgroundColor:[UIColor colorWithRed:30.0/255.0 green:185.0 / 255.0 blue:60.0 / 166.0 alpha:0.85]];
      break;
    case HPTButtonTypeSignup:
      [button setBackgroundColor:[UIColor colorWithRed:68.0 / 255.0 green:140.0 / 255.0 blue:203.0 / 166.0 alpha:0.85]];
      break;
      
    default:
      break;
  }
  
  CGRect buttonRect = (CGRect) {
    .origin = CGPointZero,
    .size = { .width = 250.0, .height = 44.0 }
  };
  
  // Equivalent to:
  // CGRectMake(0, 0, 250, 44). The above has more control and is much clearer
  
  button.frame = buttonRect;
  
  return button;
}

@end
