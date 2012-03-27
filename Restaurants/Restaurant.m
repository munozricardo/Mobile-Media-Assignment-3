//
//  Restaurant.m
//  Restaurants
//

#import "Restaurant.h"


@implementation Restaurant
@synthesize address, name, cuisineType, yearOpened;

@synthesize reviewerName, text, reviews, score, numberOfHelpfulRatings, numberOfUnhelpfulRatings;


-(int)age
{
    return 2012 - yearOpened;
}

-(Review*) mostHelpfulReview
{
    Review* mostHelpful = nil;
    for (Review* review in reviews) {
        if (review.score >5) {
            if (review.reviewsHelpfulPercentage > mostHelpful.reviewsHelpfulPercentage)
            {
                mostHelpful = review;
            }
        }
    }
    return mostHelpful;
    
}

@end
