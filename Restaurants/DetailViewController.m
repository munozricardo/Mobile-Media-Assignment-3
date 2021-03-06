//
//  DetailViewController.m
//  Restaurants
//
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize favoriteButton;

@synthesize addressLabel;
@synthesize navigationHeader;
@synthesize cuisineLabel;
@synthesize ageLabel;
@synthesize helpfulReviewPercentageLabel;
@synthesize helpfulReviewLabel;
@synthesize star1;
@synthesize star2;
@synthesize star3;
@synthesize star4;
@synthesize star5;
@synthesize reviewLabel;
@synthesize restaurant;
@synthesize showAllReviews;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
///////restaurant info/////////////////////////////
    
    addressLabel.text = [restaurant address];
    navigationHeader.title = [restaurant name];
    cuisineLabel.text = [restaurant cuisineType];
    ageLabel.text = [NSString stringWithFormat:@"Est. %i (%i years ago)", restaurant.yearOpened, [restaurant age]];
    
    

    
    
//////assign the most helpful review to helpfulReviewLabel
    helpfulReviewLabel.text = [[restaurant mostHelpfulReview] text];
    
    helpfulReviewPercentageLabel.text = [NSString stringWithFormat:@"Most helpful review - %i of %i found this review helpful",[[restaurant mostHelpfulReview] numberOfHelpfulReviews], [[restaurant mostHelpfulReview] numberOfHelpfulReviews] + [[restaurant mostHelpfulReview] numberOfUnhelpfulReviews]];
    
    /////////////loop
    NSArray* reviews = [restaurant reviews];
    for (Review* review in [restaurant reviews]) {
        // NSLog(@"Review Text: %@", review.text);
    }
    
    if (review.score > 4)
    {
        NSLog(@"This is a great review");
    }
    else if (review.score > 2)
    {
        NSLog(@"This is a mediocre review");
    }
    else
    {
        NSLog(@"This is a terrible review");
    }
    
    
    
    //////turn on the stars!!!!//
    
    float starsResult = 0;
    starsResult = [restaurant averageCustomerReview];
    
    if (starsResult > 0.5) 
    {
        star1.image = [UIImage imageNamed:@"Star_ON.png"];
        if (starsResult > 1.5) 
        {
            star2.image = [UIImage imageNamed:@"Star_ON.png"];
            if (starsResult > 2.5) 
            {
                star3.image = [UIImage imageNamed:@"Star_ON.png"];
                if (starsResult > 3.5)
                {
                    star4.image = [UIImage imageNamed:@"Star_ON.png"];
                    if (starsResult > 4.5)
                    {
                        star5.image = [UIImage imageNamed:@"Star_ON.png"];
                    }
                }
            }
        }
    }
    

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender
{
    ReviewViewController* reviewVC = (ReviewViewController*) [segue destinationViewController];
    reviewVC.restaurant = restaurant;
}


- (void)viewDidUnload
{
    [self setAddressLabel:nil];
    [self setNavigationHeader:nil];
    [self setCuisineLabel:nil];
    [self setAgeLabel:nil];
    [self setHelpfulReviewPercentageLabel:nil];
    [self setHelpfulReviewLabel:nil];
    [self setStar1:nil];
    [self setStar2:nil];
    [self setStar3:nil];
    [self setStar4:nil];
    [self setStar5:nil];
    //[self setReviewLabel:nil];
    //[self setShowAllReviews:nil];
    [self setFavoriteButton:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    

    
    
}



- (IBAction)markAsFavorite:(id)sender {
    favoriteButton.image = [UIImage imageNamed:@"heart_selected.png"];
}



@end



