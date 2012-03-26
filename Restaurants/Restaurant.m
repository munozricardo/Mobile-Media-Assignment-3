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
    NSArray* reviews = [restaurant reviews];
    for (Review* review in [restaurant reviews]) {
        if (review.score >5) {
            <#statements#>
        }
    }
    
    
}

@end
