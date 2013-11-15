//
//  PinAnnotation.h
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PinAnnotation : NSObject <MKAnnotation>

- (instancetype)initWithCoordinates:(CLLocationCoordinate2D)coordinates title:(NSString *)title;

@end
