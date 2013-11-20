//
//  InformationCell.m
//  MedAppJam
//
//  Created by Nealon Young on 11/13/13.
//  Copyright (c) 2013 Nealon Young. All rights reserved.
//

#import "InformationCell.h"

#import "UIFont+Application.h"

@implementation InformationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont mediumApplicationFontOfSize:16.0f];
        [self.contentView addSubview:self.titleLabel];
        
        self.informationLabel = [[UILabel alloc] init];
        self.informationLabel.font = [UIFont applicationFontOfSize:14.0f];
        self.informationLabel.clipsToBounds = NO;
        self.informationLabel.numberOfLines = 0;
        [self.contentView addSubview:self.informationLabel];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    self.titleLabel.frame = CGRectMake(10.0f, 5.0f, 300.0f, 20.0f);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize sizeToFit = [self.informationLabel.text sizeWithFont:[UIFont applicationFontOfSize:14.0f]
                                              constrainedToSize:CGSizeMake(300.0f, CGFLOAT_MAX)
                                                  lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    
    self.informationLabel.frame = CGRectMake(10.0f, 26.0f, sizeToFit.width, sizeToFit.height);
}

+ (CGFloat)heightWithString:(NSString *)string font:(UIFont *)font {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize sizeToFit = [string sizeWithFont:font
                          constrainedToSize:CGSizeMake(300.0f, CGFLOAT_MAX)
                              lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    
    return sizeToFit.height + 35.0f;
}

@end
