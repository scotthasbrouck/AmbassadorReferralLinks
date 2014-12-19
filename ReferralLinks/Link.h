//
//  Link.h
//  ReferralLinks
//
//  Created by Scott Hasbrouck on 12/18/14.
//  Copyright (c) 2014 Scott Hasbrouck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Link : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * count;

@end
