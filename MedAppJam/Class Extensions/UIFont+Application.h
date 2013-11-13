//
//  UIFont+Application.h
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Application)

+ (UIFont *)applicationFontOfSize:(CGFloat)size;
+ (UIFont *)boldApplicationFontOfSize:(CGFloat)size;
+ (UIFont *)boldItalicApplicationFontOfSize:(CGFloat)size;
+ (UIFont *)mediumApplicationFontOfSize:(CGFloat)size;

@end
