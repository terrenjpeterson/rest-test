//
//  WebAPITutorialViewController.m
//  WebAPITutorial
//
//  Created by Terren Peterson on 12/23/13.
//  Copyright (c) 2013 Drawrz.com. All rights reserved.
//

#import "WebAPITutorialViewController.h"
#define kStrikeIronUserID @"yourstrikeironuserid@youremail.com"
#define kStrikeIronPassword @"yourstrikeironpassword"

@interface WebAPITutorialViewController ()

@end

@implementation WebAPITutorialViewController
@synthesize enteredEmailAddress = _enteredEmailAddress;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verifyEmail:(id)sender {

    // store the value of the email address Text Field
    self.enteredEmailAddress = self.emailAddress.text;
    
    // clear out the return message label
    self.verificationResults.text = @"";
    
    // create the REST call string.
    NSString *restCallString = [NSString stringWithFormat:@"http://drawrz.herokuapp.com/getMessages?787123133"];

    // create the URL and make the rest call.
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    
    // we will want to cancel any current connections
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnXMLData = nil;
    }
    
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    
    // if the connection was successful, create the XML that will be returned
    self.apiReturnXMLData = [NSMutableData data];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)emailTextField {
    
    [emailTextField resignFirstResponder];
    return YES;
    
}
@end
