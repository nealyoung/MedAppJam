//
//  EventCell.m
//  MedAppJam
//
//  Created by Nealon Young on 11/8/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "EventCell.h"

#import "UIFont+Application.h"

@implementation EventCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.eventTypeLabel = [[UILabel alloc] init];
        self.eventTypeLabel.font = [UIFont mediumApplicationFontOfSize:16.0f];
        [self.contentView addSubview:self.eventTypeLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont italicApplicationFontOfSize:14.0f];
        self.timeLabel.textColor = [UIColor darkGrayColor];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.timeLabel];
        
        self.procedureNameLabel = [[UILabel alloc] init];
        self.procedureNameLabel.font = [UIFont applicationFontOfSize:14.0f];
        [self.contentView addSubview:self.procedureNameLabel];
        
        self.locationLabel = [[UILabel alloc] init];
        self.locationLabel.font = [UIFont applicationFontOfSize:14.0f];
        [self.contentView addSubview:self.locationLabel];

        self.locationIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location.png"]];
        [self.contentView addSubview:self.locationIconView];
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImageView];
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.eventTypeLabel.frame = CGRectMake(70.0f, 5.0f, 120.0f, 20.0f);
    self.timeLabel.frame = CGRectMake(190.0f, 5.0f, 100.0f, 20.0f);
    self.procedureNameLabel.frame = CGRectMake(70.0f, 25.0f, 220.0f, 20.0f);
    self.locationLabel.frame = CGRectMake(82.0f, 45.0f, 208.0f, 20.0f);
    
    self.locationIconView.frame = CGRectMake(70.0f, 47.0f, 9.0f, 14.0f);
    self.iconImageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
}

@end
