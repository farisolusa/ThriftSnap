//
//  HomeVC.m
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import "HomeVC.h"
#import "AppDelegate.h"
#import "LoginConfirmationVC.h"

@interface HomeVC ()

@end

@implementation HomeVC
@synthesize m_EmailTextField, m_PasswordTextField, m_ScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - LifeCycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {

  [super viewWillAppear:YES];
  self.navigationController.navigationBarHidden = NO;
  self.navigationController.navigationBar.tintColor = [UIColor blackColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -Textfields Methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

  if (textField == m_EmailTextField) {
    [m_ScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
    [m_ScrollView setContentSize:CGSizeMake(320, 540)];
  } else {
    [m_ScrollView setContentOffset:CGPointMake(0, 120) animated:YES];
        [m_ScrollView setContentSize:CGSizeMake(320, 530)];
  }
  return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  [m_ScrollView setContentSize:CGSizeMake(320, 370)];

  [textField resignFirstResponder];
  return YES;
}


#pragma mark - IBAction

-(IBAction)facebookButtonPressed:(id)sender {
  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	//Check if user has done login to his facebook account or session has expired or not
	if (![appDelegate.m_Facebook isSessionValid]) {							//Show loging dialog
		[appDelegate.m_Facebook authorize:FacebookAPIKey permissions:[NSArray arrayWithObjects:@"publish_stream",@"email",nil] delegate:self];
	}//user_photos
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You are already logged in.." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}

}

#pragma mark -
#pragma mark FBLoginSession Delegates
/**
 * Called when the dialog successful log in the user
 */
- (void)fbDidLogin{
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	//[appDelegate.m_Facebook requestWithGraphPath:@"me" andDelegate:self];
	//[appDelegate.m_Facebook requestWithGraphPath:@"100002364678513/picture" andDelegate:self];
	
	NSString* tmpStr = @"SELECT pic_square,first_name, last_name, sex,email FROM user WHERE uid = me()";
	[appDelegate.m_Facebook requestWithMethodName:@"fql.query" andParams:[NSMutableDictionary dictionaryWithObject:tmpStr forKey:@"query"] andHttpMethod:@"POST" andDelegate:self];
}

/**
 * Called when the user dismiss the dialog without login
 */
- (void)fbDidNotLogin:(BOOL)cancelled{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please login first..." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

/**
 * Called when the user is logged out
 */
- (void)fbDidLogout{
}

#pragma mark-
#pragma mark FBRequest Delegates

- (void)request:(FBRequest*)request didFailWithError:(NSError*)error{
	UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil, nil];
	[errorAlert show];
	[errorAlert release];
}

/**
 * Called just before the request is sent to the server.
 */
- (void)requestLoading:(FBRequest*)request{
}

/**
 * Called when the server responds and begins to send back data.
 */
- (void)request:(FBRequest*)request didReceiveResponse:(NSURLResponse*)response{
}

/**
 * Called when a request returns and its response has been parsed into an object.
 *
 * The resulting object may be a dictionary, an array, a string, or a number, depending
 * on thee format of the API response.
 */
- (void)request:(FBRequest*)request didLoad:(id)result{
	NSLog(@"Logged in user Data %@",result);
	NSArray* resultArray = result;
	
	//Save facebook data into appdelegate dictionary to access in all views if needed.
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.m_FacebookDataDictionary = [resultArray objectAtIndex:0];
	
	//Save facebook logged in user's name to user defaults
	NSString *fbUserName = [appDelegate.m_FacebookDataDictionary objectForKey:@"name"];
	[[NSUserDefaults standardUserDefaults] setObject:fbUserName forKey:@"fbUserName"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	//Save facebook Logged In user's profile image to document directory
	NSDictionary* dict = [resultArray objectAtIndex:0];
	NSString* pic_squareString = [dict objectForKey:@"pic_square"];
	NSURL *url = [NSURL URLWithString:pic_squareString];
	NSData *urlData = [NSData dataWithContentsOfURL:url];
	UIImage *image = [UIImage imageWithData:urlData];
	NSData *imageData = UIImagePNGRepresentation(image);
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fullPathToFile = [documentsDirectory stringByAppendingPathComponent:@"Image.jpg"];
	[imageData writeToFile:fullPathToFile atomically:YES];
	
  LoginConfirmationVC *vc = [[LoginConfirmationVC alloc] initWithNibName:@"LoginConfirmationVC" bundle:nil];
  vc.m_LoginName = [NSString stringWithFormat:@"%@ %@",[dict objectForKey:@"first_name"],[dict objectForKey:@"last_name"]];
  vc.m_ProfileImage = image;
  
  [self.navigationController pushViewController:vc animated:YES];
  [vc release];
}

/**
 * Called when a request returns a response.
 *
 * The result object is the raw response from the server of type NSData
 */
/*- (void)request:(FBRequest*)request didLoadRawResponse:(NSData*)data {
 if([[request url] isEqualToString:@"https://graph.facebook.com/me"]) {
 
 }
 
 if ([[request url] isEqualToString:@"https://api.facebook.com/method/users.getInfo"]) {
 
 }
 }*/


-(IBAction)loginButtonPressed:(id)sender {
  
}

-(IBAction)forgetPassButtonPressed:(id)sender {
  
}

#pragma mark - memory Management Methods

- (void)dealloc {

  [self.m_ScrollView release];
  [self.m_PasswordTextField release];
  [self.m_EmailTextField release];
  
  [super dealloc];
}

@end
