//
//  LinkTableViewCell.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/17/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkTableViewCell : UITableViewCell

//___________ UI Elements ___________
// > Label for link text
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// > Label for click count
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

//___________ Methods ___________
// > View Link on Touch

@end
