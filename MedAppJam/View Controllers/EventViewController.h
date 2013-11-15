//
//  EventViewController.h
//  MedAppJam
//
//  Created by Nealon Young on 11/12/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventViewController : UITableViewController

- (id)initWithEvent:(Event *)event;

@property Event *event;

@end
