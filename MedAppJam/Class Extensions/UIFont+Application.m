//
//  UIFont+Application.m
//  MedAppJam
//
//  Created by Nealon Young on 11/9/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "UIFont+Application.h"

@implementation UIFont (Application)

+ (UIFont *)applicationFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNext-Regular" size:size];
}

+ (UIFont *)boldApplicationFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNext-DemiBold" size:size];
}

+ (UIFont *)boldItalicApplicationFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNextCondensed-DemiBoldItalic" size:size];
}

+ (UIFont *)mediumApplicationFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNext-Medium" size:size];
}

@end
