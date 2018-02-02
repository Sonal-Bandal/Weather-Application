//
//  newoneViewController.m
//  forwardgeocoder
//
//  Created by Felix-ITS 004 on 13/11/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import "newoneViewController.h"

@interface newoneViewController ()

@end

@implementation newoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)btnaction:(id)sender
//
//{
//    NSLog(@"desttttt is = = = = = %@",_description1);
//    AVSpeechUtterance *utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@" description is %@",_description1]];
//   // utterance=[AVSpeechUtterance speech]
//    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
//    [synth speakUtterance:utterance];
//
//}
//- (IBAction)tempactin:(id)sender
//{
//    [AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"temperature is %@",_temmperature1]];
//    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
//    
//    [synth speakUtterance:_utterance];
//}

//- (IBAction)humidityaction:(id)sender
//{
//    _utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"humidity is %@",_humidity1]];
//    [_synth speakUtterance:_utterance];
//
//    
//}
//
//- (IBAction)nameaction:(id)sender
//{
//    _utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"name is %@",_name1]];
//    [_synth speakUtterance:_utterance];
//
//}

- (IBAction)des1:(id)sender
{
    AVSpeechUtterance *utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"description is %@",_description1]];
    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
    [synth speakUtterance:utterance];
    NSLog(@"des is ==== %@",_description1);
}

- (IBAction)tempp:(id)sender
{
    AVSpeechUtterance *utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"temperature is %@",_temmperature1]];
    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
    [synth speakUtterance:utterance];
    NSLog(@"temp is ==== %@",_temmperature1);

}

- (IBAction)humidityy:(id)sender
{
    AVSpeechUtterance *utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"humidity is %@",_humidity1]];
    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
    [synth speakUtterance:utterance];
    NSLog(@"humidity is ==== %@",_humidity1);

}

- (IBAction)name:(id)sender
{
    AVSpeechUtterance *utterance=[AVSpeechUtterance speechUtteranceWithString:[NSString stringWithFormat:@"name is %@",_name1]];
    AVSpeechSynthesizer *synth=[[AVSpeechSynthesizer alloc]init];
    [synth speakUtterance:utterance];
    NSLog(@"name is ==== %@",_name1);

}
@end
