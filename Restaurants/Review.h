//
//  Review.h
//  Restaurants
//
//  Created by generic on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject
{
    NSString* reviewerName;
    NSString* text;
    int score; //(1 to 5, how good the reviewer thought the restaurant was)
    int numberOfHelpfulRatings;
    int numberOfUnhelpfulRatings;
}

@end
