//
//  AppointmentCell.h
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AppointmentCell : UITableViewCell

@property MKMapView *mapView;
@property UIView *thumbnailContainer;

@property UILabel *procedureNameLabel;
@property UILabel *locationLabel;
@property UILabel *timeLabel;

@property UIImageView *locationIconView;
@property UIImageView *iconImageView;

@end
