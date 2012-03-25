//
//  Review.m
//  Restaurants
//
//  Created by generic on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Review.h"

@implementation Review

@synthesize reviewerName, text, score, numberOfHelpfulReviews, numberOfUnhelpfulReviews;


-(float) reviewsHelpfulPercentage
{
    return (numberOfHelpfulReviews*100)/(numberOfHelpfulReviews + numberOfUnhelpfulReviews) ;
    
}






@end
