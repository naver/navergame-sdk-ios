// NAVER Game SDK for iOS
// Copyright 2021-present NAVER Corp.
//
// Unauthorized use, modification and redistribution of this software are strongly prohibited.
//
// Created by Alan on 2021/03/11.


#import "NGSViewController.h"
#import <NNGSDK/NNGSDKManager.h>
#import "NGSCell.h"
#import "NGSCellModel.h"
#import "NGSUserCache.h"


#define NGSCellIdentifier @"NGSCell"


@interface NGSViewController () <UITableViewDataSource, UITableViewDelegate, NNGSDKDelegate>

@property (strong, nonatomic) NSArray<NGSCellModel *> *items;

@property (weak, nonatomic) UITableView *table;

@end


@implementation NGSViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self == nil) {
        return nil;
    }

    [self refreshItems];
    
    return self;
}


- (void)refreshItems {
    __weak NGSViewController *weakSelf = self;
    
    self.items = @[
        [NGSCellModel itemWithTitle:@"Banner" value:nil action:^{
            [NNGSDKManager.shared presentBannerViewController];
        }],
        [NGSCellModel itemWithTitle:@"Sorry" value:nil action:^{
            [NNGSDKManager.shared presentSorryViewController];
        }],
        [NGSCellModel itemWithTitle:@"Board" value:NGSUserCache.shared.boardId action:^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter a board ID" message:nil preferredStyle:UIAlertControllerStyleAlert];
            alert.popoverPresentationController.sourceView = weakSelf.view;
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"Board ID";
                
                NSNumber *boardId = NGSUserCache.shared.boardId;
                
                if (boardId == nil) {
                    return;
                }
                
                textField.text = [NSString stringWithFormat:@"%@", boardId];
            }];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSString *input = alert.textFields.firstObject.text;
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                NSNumber *boardId = [formatter numberFromString:input];
                NGSUserCache.shared.boardId = boardId;
                [NNGSDKManager.shared presentBoardViewControllerWith:boardId];
                [weakSelf refreshItems];
                [weakSelf.table reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [weakSelf presentViewController:alert animated:YES completion:nil];
        }],
        [NGSCellModel itemWithTitle:@"Feed" value:NGSUserCache.shared.feedId action:^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter a feed ID" message:nil preferredStyle:UIAlertControllerStyleAlert];
            alert.popoverPresentationController.sourceView = weakSelf.view;
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"Feed ID";
                
                NSNumber *feedId = NGSUserCache.shared.feedId;
                
                if (feedId == nil) {
                    return;
                }
                
                textField.text = [NSString stringWithFormat:@"%@", feedId];
            }];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSString *input = alert.textFields.firstObject.text;
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                NSNumber *feedId = [formatter numberFromString:input];
                NGSUserCache.shared.feedId = feedId;
                [NNGSDKManager.shared presentFeedViewControllerWith:feedId scheduled:NO];
                [weakSelf refreshItems];
                [weakSelf.table reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [weakSelf presentViewController:alert animated:YES completion:nil];
        }],
        [NGSCellModel itemWithTitle:@"Temporary Feed" value:NGSUserCache.shared.temporaryFeedId action:^{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Enter a temporary feed ID" message:nil preferredStyle:UIAlertControllerStyleAlert];
            alert.popoverPresentationController.sourceView = weakSelf.view;
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"Temporary Feed ID";
                
                NSNumber *feedId = NGSUserCache.shared.temporaryFeedId;
                
                if (feedId == nil) {
                    return;
                }
                
                textField.text = [NSString stringWithFormat:@"%@", feedId];
            }];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSString *input = alert.textFields.firstObject.text;
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                NSNumber *feedId = [formatter numberFromString:input];
                NGSUserCache.shared.temporaryFeedId = feedId;
                [NNGSDKManager.shared presentFeedViewControllerWith:feedId scheduled:YES];
                [weakSelf refreshItems];
                [weakSelf.table reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
            [weakSelf presentViewController:alert animated:YES completion:nil];
        }],
        [NGSCellModel itemWithTitle:@"Country Code" value:NNGSDKManager.shared.countryCode action:nil]
    ];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSDK];
    [self setupView];
}


- (void)setupSDK {
    [NNGSDKManager.shared setClientId:@"UKvNABLDsyEJusJGsXL2" clientSecret:@"rK4suc_Qd0" loungeId:@"naver_game_4developer"];
    [NNGSDKManager.shared setParentViewController:self];
    NNGSDKManager.shared.delegate = self;
}


- (void)setupView {
    self.table = ^{
        UITableView *table = [[UITableView alloc] init];
        table.translatesAutoresizingMaskIntoConstraints = NO;
        table.rowHeight = 50;
        [table registerClass:[NGSCell class] forCellReuseIdentifier:NGSCellIdentifier];
        table.dataSource = self;
        table.delegate = self;
        
        [self.view addSubview:table];
        
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:table attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
            [NSLayoutConstraint constraintWithItem:table attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
            [NSLayoutConstraint constraintWithItem:table attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0],
            [NSLayoutConstraint constraintWithItem:table attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
        ]];
        
        return table;
    }();
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NGSCell *cell = [tableView dequeueReusableCellWithIdentifier:NGSCellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row >= self.items.count) {
        return cell;
    }
    
    NGSCellModel *item = self.items[indexPath.row];
    cell.titleLabel.text = item.title;
    cell.valueLabel.text = item.value;
    
    return cell;
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row >= self.items.count) {
        return;
    }
    
    NGSCellModel *item = self.items[indexPath.row];
    
    if (item.action != nil) {
        item.action();
    }
}


#pragma mark NNGSDKDelegte

- (void)nngSDKDidLoad {
    NSLog(@"SDK is loaded.");
}


- (void)nngSDKDidUnload {
    NSLog(@"SDK is unloaded.");
}


- (void)nngSDKDidReceiveInGameMenuCode:(NSString *)inGameMenuCode {
    NSLog(@"An In-Game Menu Code received: [%@]", inGameMenuCode);
}

@end
