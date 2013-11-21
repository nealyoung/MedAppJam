//
//  TextFieldCell.m
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "TextFieldCell.h"

#import "UIFont+Application.h"

@implementation TextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.tintColor = [UIColor colorWithRed:0xED/255.0 green:0x7A/255.0 blue:0x5D/255.0 alpha:1.0f];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 20)];
        self.label.textColor = [UIColor darkGrayColor];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.font = [UIFont mediumApplicationFontOfSize:16.0f];
        [self.contentView addSubview:self.label];
        
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.contentView.frame) - 240.0f, 10.0f, 220.0f, 24.0f)];
        self.textField.font = [UIFont applicationFontOfSize:16.0f];
        self.textField.placeholder = @"Text Field";
        self.textField.textColor = [UIColor darkGrayColor];
        self.textField.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
