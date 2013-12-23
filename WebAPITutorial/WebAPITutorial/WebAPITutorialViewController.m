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
#define myDrawrzAcct @"787123133"

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
    
    // create the REST call string including setting variables in the URI
    NSString *restCallString = [NSString stringWithFormat:@"http://drawrz.herokuapp.com/getMessages?%@", myDrawrzAcct];

    // create the URL and create the request
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSURLRequest *restRequest = [NSURLRequest requestWithURL:restURL];
    
    // we will want to cancel any current connections
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnXMLData = nil;
    }
    
    // create the url connection and fire the request
    currentConnection = [[NSURLConnection alloc] initWithRequest:restRequest delegate:self];
    
    // if the connection was successful, create the XML that will be returned
    self.apiReturnXMLData = [NSMutableData data];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)emailTextField {
    
    [emailTextField resignFirstResponder];
    return YES;
    
}

// Delegate for NSURLConnection - didReceiveResponse
- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.apiReturnXMLData setLength:0];
}

// Delegate for NSURLConnection - didReceiveData
- (void)connection:(NSURLConnection*)connection didReceiveData:(NSData*)data
{
    [self.apiReturnXMLData appendData:data];
}

// Delegate for NSURLConnection - didFailWithError
- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
    NSLog(@"URL Connection Failed!");
    currentConnection = nil;
}

// Delegate for NSURLConnection - connectionDidFinishLoading (transaction complete)
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    currentConnection = nil;
}

@end