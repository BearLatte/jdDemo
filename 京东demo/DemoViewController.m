//
//  DemoViewController.m
//  京东demo
//
//  Created by Latte_Bear on 16/2/21.
//  Copyright © 2016年 Latte_Bear. All rights reserved.
//

#import "DemoViewController.h"
//@interface MyCollectionViewCell : UICollectionViewCell
//@property (nonatomic, strong) UIImageView *imageView;
//@end
//@implementation MyCollectionViewCell
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self.contentView addSubview:self.imageView];
//    }
//    return self;
//}
//- (UIImageView *)imageView {
//    if (!_imageView) {
//        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    }
//    return _imageView;
//}
//@end
@interface DemoViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
///假数据数组
@property (nonatomic, strong) NSArray *dataArray;
///假数据字典
@property (nonatomic, strong) NSDictionary *dataDictionary;
@property (nonatomic, strong) NSString *key;
@end

@implementation DemoViewController


static NSString * const reusableIdentifier = @"reusableCell";


- (NSDictionary *)dataDictionary {
    if (!_dataDictionary) {
//        for (int i = 0; i < self.dataArray.count; i ++) {
//            _dataDictionary[self.dataArray[i]] =
//        }
        _dataDictionary = @{
                            @"潮流女装" :@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"],
                            @"品牌男装" :@[@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg",@"12.jpg"],
                            @"酒水饮料" :@[@"13.jpg",@"14.jpg",@"15.jpg",@"16.jpg",@"17.jpg",@"18.jpg"],
                            @"家用电器" :@[@"19.jpg",@"20.jpg",@"21.jpg",@"22.jpg",@"23.jpg",@"24.jpg",@"25.jpg"],
                            @"推荐分类" :@[@"26.jpg",@"27.jpg",@"28.jpg",@"29.jpg",@"30.jpg",@"31.jpg"],
                            @"奢品礼品" :@[@"32.jpg",@"33.jpg",@"34.jpg",@"35.jpg",@"36.jpg",@"37.jpg"],
                            @"电脑办公" :@[@"38.jpg",@"39.jpg",@"40.jpg",@"41.jpg",@"42.jpg",@"43.jpg"],
                            @"手机数码" :@[@"44.jpg",@"45.jpg",@"46.jpg",@"47.jpg",@"48.jpg",@"49.jpg"],
                            @"母婴频道" :@[@"50.jpg",@"51.jpg",@"52.jpg",@"53.jpg",@"54.jpg",@"55.jpg"],
                            @"图书"    :@[@"56.jpg",@"57.jpg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"],
                            @"家具家纺" :@[@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg",@"12.jpg"],
                            @"居家生活" :@[@"13.jpg",@"14.jpg",@"15.jpg",@"16.jpg",@"17.jpg",@"18.jpg"],
                            @"家居建材" :@[@"19.jpg",@"20.jpg",@"21.jpg",@"22.jpg",@"23.jpg",@"24.jpg",@"25.jpg"]
                            };
    }
    return _dataDictionary;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(80, 80);
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _collectionView.collectionViewLayout = layout;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - (self.view.bounds.size.width - self.tableView.bounds.size.width), 64, self.view.bounds.size.width - self.tableView.bounds.size.width, self.view.bounds.size.height - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"推荐分类",@"潮流女装",@"品牌男装",@"酒水饮料",@"家用电器",@"奢品礼品",@"电脑办公",@"手机数码",@"母婴频道",@"图书",@"家具家纺",@"居家生活",@"家居建材"];
    }
    return _dataArray;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width / 4, self.view.bounds.size.height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reusableIdentifier];
    NSIndexPath *indexPath = 0;
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    self.title = @"分类";
}
#pragma mark - UITableViewDataSource And UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static  NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.8];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.key = self.dataArray[indexPath.row];
    [self.collectionView reloadData];
}
#pragma mark - UICollectionViewDelegate And UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.dataDictionary[self.key];
    return array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusableIdentifier forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    NSArray *imageNames = self.dataDictionary[self.key];
    imageView.image = [UIImage imageNamed:imageNames[indexPath.row]];
    [cell.contentView addSubview:imageView];
    return cell;
}

@end
