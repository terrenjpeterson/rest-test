//
//  WebAPITutorialViewController.h
//  WebAPITutorial
//
//  Created by Terren Peterson on 12/23/13.
//  Copyright (c) 2013 Drawrz.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebAPITutorialViewController : UIViewController <UITextFieldDelegate>
{
    NSURLConnection *currentConnection;
}
- (IBAction)verifyEmail:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;
@property (weak, nonatomic) IBOutlet UILabel *verificationResults;
@property (copy, nonatomic) NSString *enteredEmailAddress;
@property (retain, nonatomic) NSMutableData *apiReturnXMLData;
@end
