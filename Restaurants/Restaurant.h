//
//  Restaurant.h
//  Restaurants
//

#import <Foundation/Foundation.h>
#import "Review.h"


@interface Restaurant : NSObject
{
    NSString* address;
    NSString* name;
    NSString* cuisineType;
    int yearOpened;
    
    //int starsTotal;
    //float stars;
    
    NSString* reviewerName;
    NSString* text;
    
    
}
@property(readwrite, strong) NSString* address;
@property(readwrite, strong) NSString* name;
@property(readwrite, strong) NSString* cuisineType;
@property(readwrite) int yearOpened;

-(int)age;

@property(readwrite, strong) NSString* reviewerName;
@property(readwrite, strong) NSString* text;
@property(readwrite, strong) NSArray* reviews;//create array for reviews

@property(readwrite) int score;
@property(readwrite) int numberOfHelpfulRatings;
@property(readwrite) int numberOfUnhelpfulRatings;
//@property(readwrite) int starsTotal;
@property(readwrite) float stars;



-(Review*) mostHelpfulReview;
//@property(readwrite) Review mostHelpful;

-(float) averageCustomerReview;

@end
