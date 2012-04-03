//
//  Restaurant.m
//  Restaurants
//

#import "Restaurant.h"


@implementation Restaurant
@synthesize address, name, cuisineType, yearOpened;

@synthesize reviewerName, text, reviews, score, numberOfHelpfulRatings, numberOfUnhelpfulRatings, stars;

//@synthesize mostHelpful;

-(int)age
{
    return 2012 - yearOpened;
}

-(Review*) mostHelpfulReview
{
    Review* mostHelpful = nil;
    for (Review* review in reviews) {
        if (review.numberOfHelpfulReviews >5) {
            if (review.reviewsHelpfulPercentage > mostHelpful.reviewsHelpfulPercentage)
            {
                mostHelpful = review;
            }
        }
    }
    return mostHelpful;
}

-(float) averageCustomerReview
{
    //float* stars = nil;
    for (Review* review in reviews){
        stars = stars + review.score;
    }
    return stars;
}



@end
