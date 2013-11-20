//
//  AppointmentCell.m
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "AppointmentCell.h"

#import <MapKit/MapKit.h>
#import "PinAnnotation.h"
#import "UIFont+Application.h"

@implementation AppointmentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.procedureNameLabel = [[UILabel alloc] init];
        self.procedureNameLabel.font = [UIFont mediumApplicationFontOfSize:15.0f];
        [self.contentView addSubview:self.procedureNameLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont italicApplicationFontOfSize:13.0f];
        self.timeLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.timeLabel];
        
        self.locationLabel = [[UILabel alloc] init];
        self.locationLabel.font = [UIFont applicationFontOfSize:14.0f];
        self.locationLabel.numberOfLines = 0;
        self.locationLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.locationLabel];
        
        self.locationIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location.png"]];
        [self.contentView addSubview:self.locationIconView];
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImageView];
        
        self.thumbnailContainer = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 90.0f, 28.0f, 75.0f, 75.0f)];
        self.thumbnailContainer.clipsToBounds = YES;
        self.thumbnailContainer.layer.borderWidth = 2.0f;
        self.thumbnailContainer.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        self.thumbnailContainer.layer.cornerRadius = 3;
        [self.contentView addSubview:self.thumbnailContainer];
        
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 75.0f, 75.0f)];
        self.mapView.userInteractionEnabled = NO;
        //self.mapView.centerCoordinate = [pin coordinate];
        //[self.mapView addAnnotation:pin];
        
        // Remove the 'legal' link
        [[self.mapView.subviews objectAtIndex:1] removeFromSuperview];
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.mapView.centerCoordinate, 600, 600);
        self.mapView.region = region;
        //thumbnailMap.transform = CGAffineTransformMakeScale(0.75, 0.75);
        // We add 10 pixels on the y coordinate, to center the pin in the view. Moreover it will hide the "legal" label of the map view.
        //self.mapView.layer.position = CGPointMake(self.thumbnailContainer.bounds.size.width / 2, self.thumbnailContainer.bounds.size.height / 2 + 10);
        [self.thumbnailContainer addSubview:self.mapView];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    self.procedureNameLabel.frame = CGRectMake(70.0f, 5.0f, 240.0f, 20.0f);
    self.timeLabel.frame = CGRectMake(70.0f, 25.0f, 156.0f, 20.0f);
    self.locationLabel.frame = CGRectMake(82.0f, 45.0f, 144.0f, 60.0f);
    
    self.locationIconView.frame = CGRectMake(70.0f, 48.0f, 9.0f, 14.0f);
    self.iconImageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
}

@end
