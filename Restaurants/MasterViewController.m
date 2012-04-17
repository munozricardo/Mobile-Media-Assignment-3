//
//  MasterViewController.m
//  Restaurants
//
//

#import "MasterViewController.h"
#import "Restaurant.h"


@implementation MasterViewController
@synthesize restaurants;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    restaurants = [[NSMutableArray alloc] init];
    
///Pio Pio
    
    
    
    Restaurant* piopio = [[Restaurant alloc] init];
        
    piopio.name = @"Pio Pio";
    piopio.address = @"746 First Avenue\nNew York, NY 10128";
    piopio.cuisineType = @"Peruvian";
    piopio.yearOpened = 1995;
    
    Review* pioReview1 = [[Review alloc] init];
    pioReview1.text = @"What fab-u-lass chicken! We could eat it all day if we didn't have to stop to drink sangria!";
    pioReview1.reviewerName = @"The Addams";
    pioReview1.score = 5;
    pioReview1.numberOfHelpfulReviews = 19;
    pioReview1.numberOfUnhelpfulReviews = 8;
    
    Review* pioReview2 = [[Review alloc] init];
    pioReview2.text = @"I DONE POSTED ON DA INTARWEBS!";
    pioReview2.reviewerName = @"Anonymous";
    pioReview2.score = 1;
    pioReview2.numberOfHelpfulReviews = 0;
    pioReview2.numberOfUnhelpfulReviews = 45;
    
    Review* pioReview3 = [[Review alloc] init];
    pioReview3.text = @"Some of the best chicken I've ever eaten. A helpful tip: get some green (Aji) sauce to go, they sell it by the pint!";
    pioReview3.reviewerName = @"Jim Carr";
    pioReview3.score = 5;
    pioReview3.numberOfHelpfulReviews = 28;
    pioReview3.numberOfUnhelpfulReviews = 2;
    
    Review* pioReview4 = [[Review alloc] init];
    pioReview4.text = @"While the food is amazing, they often simply don't pick up the phone when ordering out!";
    pioReview4.reviewerName = @"Paul";
    pioReview4.score = 4;
    pioReview4.numberOfHelpfulReviews = 14;
    pioReview4.numberOfUnhelpfulReviews = 5;
    
    
    /////////////Array
    piopio.reviews = [[NSMutableArray alloc] initWithObjects:pioReview1, pioReview2, pioReview3, pioReview4, nil];


///Teriyaki Boy
        
    Restaurant* teriyakiboy = [[Restaurant alloc] init];
    
    teriyakiboy.name = @"Teriyaki Boy";
    teriyakiboy.address = @"1640 3rd Ave\nNew York, NY 10128";
    teriyakiboy.cuisineType = @"Japanese";
    teriyakiboy.yearOpened = 1995;
    
    self.restaurants = [[NSMutableArray alloc] initWithObjects:piopio, teriyakiboy, nil];
    
    
    Review* tboyReview1 = [[Review alloc] init];
    tboyReview1.text = @"Their pork cutlet curry is as authentic as it can be.";
    tboyReview1.reviewerName = @"NY U.";
    tboyReview1.score = 4;
    tboyReview1.numberOfHelpfulReviews = 16;
    tboyReview1.numberOfUnhelpfulReviews = 6;
    
    Review* tboyReview2 = [[Review alloc] init];
    tboyReview2.text = @"Teriyaki Boy is no frills and pretty good, especially for the price.";
    tboyReview2.reviewerName = @"Le T.";
    tboyReview2.score = 1;
    tboyReview2.numberOfHelpfulReviews = 0;
    tboyReview2.numberOfUnhelpfulReviews = 42;
    
    Review* tboyReview3 = [[Review alloc] init];
    tboyReview3.text = @"Not bad a bad lunch choice. Like many others, I was drawn in by their prices.";
    tboyReview3.reviewerName = @"Matt B.";
    tboyReview3.score = 5;
    tboyReview3.numberOfHelpfulReviews = 19;
    tboyReview3.numberOfUnhelpfulReviews = 6;
    
    
    /////////////Array
    teriyakiboy.reviews = [[NSMutableArray alloc] initWithObjects:tboyReview1, tboyReview2, tboyReview3, nil];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [restaurants count];
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell identifier set in the storyboard 
    NSString* cellIdentifier = @"RestaurantCell";
    //reuse a cell, return a UITableVieCell with identifier
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //find the proper restaurant by asking in the array @ indexPath
    Restaurant* currentRestaurant = [restaurants objectAtIndex:indexPath.row];
    
    
    //see textLabel (name of Rest) and detailTextLabel (cuisine)
    cell.textLabel.text = currentRestaurant.name;
    cell.detailTextLabel.text = currentRestaurant.cuisineType;
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController* detailVC = (DetailViewController*)[segue destinationViewController];
    
    UITableView* table = [self tableView];
    
    NSIndexPath* indexPath = [table indexPathForSelectedRow];
    
    Restaurant* currentRestaurant = [restaurants objectAtIndex:indexPath.row];
    
    detailVC.restaurant = currentRestaurant;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
