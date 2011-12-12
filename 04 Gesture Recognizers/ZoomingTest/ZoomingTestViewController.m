//
//  ZoomingTestViewController.m
//  ZoomingTest
//
//  Created by Leonty Deriglazov on 06.12.11.
//  Copyright 2011 iOS Development School. All rights reserved.
//

#import "ZoomingTestViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZoomingTestViewController {
	CGFloat currentScale;
	CGFloat currentRotation;
}

@synthesize customView;

- (void)dealloc
{
    [customView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView {
	//XXX
    [[NSBundle mainBundle] loadNibNamed:@"ZoomingTestViewController" owner:self options:nil];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)];
    [self.customView addGestureRecognizer:pinchRecognizer];
	pinchRecognizer.cancelsTouchesInView = NO;
    pinchRecognizer.delegate = self;
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [self.customView addGestureRecognizer:rotationRecognizer];
	rotationRecognizer.cancelsTouchesInView = NO;
	currentScale = 1.0;
	currentRotation = 0.0;
	
	self.customView.layer.shadowOpacity = 1.0;
	self.customView.layer.shadowRadius = 5;
	self.customView.layer.shadowOffset = CGSizeMake(0, 0);
}

- (void)rotate:(UIRotationGestureRecognizer *)rotationsRecognizer {
    CGFloat rotatation = rotationsRecognizer.rotation - currentRotation;
    self.customView.transform = CGAffineTransformRotate(self.customView.transform, rotatation);
	currentRotation += rotatation;
}

- (void)scale:(UIPinchGestureRecognizer *)pinchrecognizer {
    CGFloat scale = pinchrecognizer.scale;
	if ( 0.01 > currentScale) {
		return;
	}
	CGAffineTransform unitScale = CGAffineTransformScale(self.customView.transform, 1/currentScale, 1/currentScale);
    self.customView.transform = CGAffineTransformScale(unitScale, scale, scale);
	currentScale = scale;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	currentScale = 1.0;
	currentRotation = 0.0;
}

- (void)viewDidUnload
{
    self.customView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
