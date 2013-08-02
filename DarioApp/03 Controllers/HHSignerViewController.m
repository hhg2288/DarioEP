//
//  HHSignerViewController.m
//  DarioApp
//
//  Created by Horacio Herrera on 7/25/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

/*
#import "HHSignerViewController.h"

#define TITLE_WIDTH 220
#define LINE_WIDTH 1.0
#define SIGNER_WIDTH 840
#define SIGNER_HEIGHT 402
#define SIGNER_TOP_MARGIN 130
#define Y_OFFSET 0.0

@interface HHSignerViewController ()

@end

@implementation HHSignerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //indexValue = 0;
    signatureId = 0;
    
    self.view.backgroundColor = [UIColor clearColor];
    // self.view.alpha = 0.7;
    
    backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SignerBackground_3.png"]];
    backgroundImageView.frame = CGRectMake(0.0, 0.0, 1024, 650);
    [self.view addSubview:backgroundImageView];
    
    title = [[UILabel alloc] initWithFrame:CGRectMake( (1024-TITLE_WIDTH)/2 , 70, TITLE_WIDTH, 40)];
    title.text = @"Please Sign Here";
    title.backgroundColor = [UIColor clearColor];
    [title setFont:[UIFont systemFontOfSize:24]];
    [title setTextAlignment:UITextAlignmentCenter];
    [self.view addSubview:title];
    
	drawImage = [[UIImageView alloc] initWithFrame:CGRectMake( (self.view.frame.size.height - SIGNER_WIDTH)/2, SIGNER_TOP_MARGIN, SIGNER_WIDTH, SIGNER_HEIGHT)];
    drawImage.backgroundColor = [UIColor clearColor];
	[self.view addSubview:drawImage];
	mouseMoved = 0;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(780.0, 544.0, 123.0, 38.0);
    [self.view addSubview:button];
    button.titleLabel.text = @"Save";
    // [button setTitle:@"Save" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"bt_Save_Unselected.png"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"bt_Save_Selected.png"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    
    clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clearButton.frame = CGRectMake(780.0 - 134, 544.0, 123.0, 38.0);
    [clearButton setImage:[UIImage imageNamed:@"bt_Clear_Unselected.png"] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:@"bt_Clear_Selected.png"] forState:UIControlStateHighlighted];
    clearButton.tag = 2;
    [self.view addSubview:clearButton];
    //[clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(resetAction) forControlEvents:UIControlEventTouchUpInside];
    
    cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame = CGRectMake(780.0 - 134 - 134, 544.0, 123.0, 38.0);
    [cancelButton setImage:[UIImage imageNamed:@"bt_Cancel_Unselected.png"] forState:UIControlStateNormal];
    [cancelButton setImage:[UIImage imageNamed:@"bt_Cancel_Selected.png"] forState:UIControlStateHighlighted];
    cancelButton.tag = 3;
    [self.view addSubview:cancelButton];
    // [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //NSLog(@"signing ID: %d", signatureId);
}

- (void) updateSigningImage
{
    //NSLog(@"update the image for signing if there is already a signature there... %d", self.signatureId);
    drawImage.image = nil;
}

- (void) cancelAction
{
    //[(ReleaseFormViewController*)self.delegate cancel];
}

- (void) resetAction
{
    drawImage.image = nil;
}

- (void) writeImageToCurrentDirWithName: (NSString*) name
{
    UIImage *anImage = [UIImage imageNamed:name];
    NSData *imageData = UIImagePNGRepresentation(anImage);
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *currentDir = [docsDir stringByAppendingPathComponent:[[(LightSaverAppDelegate*)[UIApplication sharedApplication].delegate currentHousehold].homeUid stringValue]];
    
    [imageData writeToFile:[currentDir stringByAppendingPathComponent:name] atomically:NO];
}

- (void) saveAction
{
    //NSLog(@"save the content of the image view.");
    
    [self writeImageToCurrentDirWithName:SIGNER_FILE_NAME];
    [self writeImageToCurrentDirWithName:N2N_LOGO_IMAGE_FILE_NAME];
    
    int idNum = [[(LightSaverAppDelegate*)[UIApplication sharedApplication].delegate currentHousehold].homeUid intValue];
    
    NSData *theImageData = UIImagePNGRepresentation(drawImage.image);
    LightSaverAppDelegate *appDelegate = (LightSaverAppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *currentDir = [docsDir stringByAppendingPathComponent:[[appDelegate.currentHousehold homeUid] stringValue]];
    self.signatureImagefileName = [signatureFilePrefix stringByAppendingFormat:@"%d_%d.png", idNum, signatureId];
    
    [theImageData writeToFile:[currentDir stringByAppendingPathComponent:self.signatureImagefileName] atomically:YES];
    
    [self.delegate hide];
    [self.delegate updatePageWithSignatureFile: (NSString*)self.signatureImagefileName];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"touches began");
	mouseSwiped = NO;
	UITouch *touch = [touches anyObject];
    
	if ([touch tapCount] == 2) {
		drawImage.image = nil;
		return;
	}
    
	lastPoint = [touch locationInView:drawImage];
	lastPoint.y -= Y_OFFSET;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	mouseSwiped = YES;
	UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView:drawImage];
	currentPoint.y -= Y_OFFSET;
	
	UIGraphicsBeginImageContext(drawImage.frame.size);
    
	[drawImage.image drawInRect:CGRectMake(0, 0, drawImage.frame.size.width, drawImage.frame.size.height)];
	CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
	CGContextSetLineWidth(UIGraphicsGetCurrentContext(), LINE_WIDTH);
	CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
	CGContextBeginPath(UIGraphicsGetCurrentContext());
	CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
	CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
	CGContextStrokePath(UIGraphicsGetCurrentContext());
	drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	lastPoint = currentPoint;
    
	mouseMoved++;
	
	if (mouseMoved == 10) {
		mouseMoved = 0;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(!mouseSwiped) {
		UIGraphicsBeginImageContext(drawImage.frame.size);
		[drawImage.image drawInRect:CGRectMake(0, 0, drawImage.frame.size.width, drawImage.frame.size.height)];
		CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
		CGContextSetLineWidth(UIGraphicsGetCurrentContext(), LINE_WIDTH);
		CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
		CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
		CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
		CGContextStrokePath(UIGraphicsGetCurrentContext());
		CGContextFlush(UIGraphicsGetCurrentContext());
		drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
	}
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

@end
*/