//
//  PinAnnotation.m
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "PinAnnotation.h"

@interface PinAnnotation () {
    CLLocationCoordinate2D _coordinates;
    NSString *_title;
}

@end

@implementation PinAnnotation

//@synthesize coordinate, title, subtitle;

- (instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinates title:(NSString *)title {
    self = [super init];
    
    if (self) {
        _coordinates = coordinates;
        _title = title;
    }
    
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    return _coordinates;
}

- (NSString *)subtitle {
    return nil;
}

- (NSString *)title {
    return _title;
}

@end
