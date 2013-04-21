//
// Created by azu on 2013/04/21.
//

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000

#import <SenTestingKit/SenTestingKit.h>

/*
    iOS6 ~
    NSDictionary をモデルにしたコレクション
    https://developer.apple.com/library/ios/#documentation/Cocoa/Reference/NSMapTable_class/Reference/NSMapTable.html
 */


@interface NSMapTableTests : SenTestCase
@end

@implementation NSMapTableTests {
}

- (void)setUp {
}

- (void)testNSMapTableEmpty {
    NSMapTable *mapTable /*TODO: 空のNSMapTableを作成*/;
    assertThat(mapTable, notNilValue());// nilではなく
    if (mapTable != nil) {
        assertThat(mapTable, instanceOf([NSMapTable class]));//NSMapTableのインスタンス
        assertThat(mapTable, is(empty()));// 要素数が0の空のコレクション
    }
}

// NSDictionaryと同じようにkey=valueを追加する
- (void)testNSMapTableSetObjectWithString {
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    /*TODO: @"key"=@"value"を持つ辞書を作成*/;
    id value = [mapTable objectForKey:@"key"];
    assertThat(value, equalTo(@"value"));
}

// objectをkeyにしてvalueを追加する
- (void)testNSMapTableSetObjectWithObject {
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    NSObject *objectAsKey = [[NSObject alloc] init];
    /*TODO: objectAsKey=@"value"を持つ辞書を作成*/;
    id value = [mapTable objectForKey:objectAsKey];
    assertThat(value, equalTo(@"value"));
    assertThatInteger([mapTable count], equalToInteger(1));
}

// NSMapTableからentryを削除する
- (void)testNSMapTableRemove {
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    NSDate *dateAsKey = [NSDate date];
    [mapTable setObject:@"value" forKey:dateAsKey];
    /*TODO: objectAsKeyを辞書から削除する */;
    id value = [mapTable objectForKey:dateAsKey];
    assertThat(value, nilValue());
}
// NSMapTableからentryを全て削除する
- (void)testNSMapTableRemoveAllObjects {
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    for (int i = 0; i < 100; i++) {
        NSDate *dateAsKey = [NSDate dateWithTimeIntervalSinceNow:i];
        [mapTable setObject:dateAsKey forKey:[@(i) stringValue]];
    }
    /*TODO: 辞書からすべてのkeyを削除する */;
    assertThatInteger([mapTable count], equalToInteger(0));
}

// NSMapTableをNSDictionaryで表示する
- (void)testNSMapTableDictionaryRepresentation {
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    [mapTable setObject:@"value" forKey:@"key"];
    NSDictionary *expectDictionary = @{
        @"key" : @"value"
    };
    ;
    NSDictionary *resultDictionary /*TODO: mapTableをNSDictionaryとして返す */;
    assertThat(resultDictionary, equalTo(expectDictionary));
}
@end

#endif