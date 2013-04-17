//
//  NSSetTests.m
//  objc-assessment
//
//  Created by azu on 07/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSSetTests.h"

@implementation NSSetTests

- (void)testNSSetEmpty {
    NSSet *set = [NSSet set];
    assertThat(set, notNilValue());// nilではなく
    if (set != nil) {
        assertThat(set, instanceOf([NSSet class]));//NSSetのインスタンス
        assertThat(set, is(empty()));// 要素数が0の空のコレクション
    }
}

// @"item"を持つNSSetを作成
- (void)testNSSetInit {
    NSSet *set = [[NSSet alloc] initWithArray:@[@"item"]];
    assertThat(set, hasItem(@"item"));
}

// 配列からNSSetを作成
- (void)testNSSetInitWithArray {
    NSArray *array = @[@"foo", @"bar"];
    NSSet *set = [[NSSet alloc] initWithArray:array];
    assertThat(set, hasItems(@"foo", @"bar", nil));
}

// NSSetから配列を作成
- (void)testArrayFromNSSet {
    NSSet *set = [NSSet setWithObjects:@"foo", @"bar", nil];
    NSArray *array = [set allObjects];
    assertThat(array, hasItems(@"foo", @"bar", nil));
}

// 重複とNSSet
- (void)testNSSetDuplication {
    NSArray *array = @[@"foo", @"foo", @"bar"];
    NSSet *set = [NSSet setWithArray:array];
    // NSArray -> NSSet とした時に set に入ってる中身と同じsetを作る
    NSSet *expectedSet = [NSSet setWithObjects:@"foo", @"bar", nil];
    assertThat(set, equalTo(expectedSet));
    assertThat(set, hasCountOf([expectedSet count]));
}

// 和集合：集合に含まれている要素を全て集める
- (void)testNSSetUnion {
    NSSet *worldA = [NSSet setWithObjects:@"nihon", @"US", nil];
    NSSet *worldB = [NSSet setWithObjects:@"nihon", @"Canada", nil];
    NSMutableSet *worlds = [NSMutableSet set];
    [worlds unionSet:worldA];
    [worlds unionSet:worldB];
    assertThat(worlds, hasItems(@"nihon", @"US", @"Canada", nil));
    assertThat(worlds, hasCountOf(3));
}

// 積集合：集合と集合の共通要素を抽出
- (void)testNSSetIntersect {
    NSSet *worldA = [NSSet setWithObjects:@"nihon", @"US", nil];
    NSSet *worldB = [NSSet setWithObjects:@"nihon", @"Canada", nil];
    NSMutableSet *worlds = [NSMutableSet setWithSet:worldA];
    [worlds intersectSet:worldB];
    assertThat(worlds, hasItem(@"nihon"));
    assertThat(worlds, hasCountOf(1));

}

// 差集合：集合から別の集合に含まれる要素を全て取り除く
- (void)testNSSetMinus {
    NSSet *worldA = [NSSet setWithObjects:@"nihon", @"US", nil];
    NSSet *worldB = [NSSet setWithObjects:@"nihon", @"Canada", nil];
    NSMutableSet *worlds = [NSMutableSet setWithSet:worldA];
    [worlds minusSet:worldB];
    assertThat(worlds, hasItem(@"US"));
    assertThat(worlds, hasCountOf(1));
}

// NSOrderSet
// NSIndexSet
@end
