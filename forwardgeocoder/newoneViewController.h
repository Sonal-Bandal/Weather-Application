//
//  newoneViewController.h
//  forwardgeocoder
//
//  Created by Felix-ITS 004 on 13/11/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface newoneViewController : UIViewController
//- (IBAction)btnaction:(id)sender;
@property AVSpeechUtterance *utterance;
@property AVSpeechSynthesizer *synth;

- (IBAction)des1:(id)sender;

- (IBAction)tempp:(id)sender;
- (IBAction)humidityy:(id)sender;
- (IBAction)name:(id)sender;


//- (IBAction)tempactin:(id)sender;
//- (IBAction)humidityaction:(id)sender;
//
//- (IBAction)nameaction:(id)sender;
//
//@property (strong, nonatomic) IBOutlet UIButton *des;
//
@property NSString *description1,*temmperature1,*humidity1,*name1;
//@property (strong, nonatomic) IBOutlet UIButton *temppp;
//@property (strong, nonatomic) IBOutlet UIButton *humidityyy;
//@property (strong, nonatomic) IBOutlet UIButton *nameeee;

@property AVAudioPlayer *player;


@end
