//
//  EventCell.h
//  MedAppJam
//
//  Created by Nealon Young on 11/8/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
@interface EventCell : UITableViewCell

@property Event *event;

@property UIImageView *locationIconView;
@property UIImageView *iconImageView;

@property UILabel *eventTypeLabel;
@property UILabel *procedureNameLabel;
@property UILabel *locationLabel;
@property UILabel *timeLabel;

@end
