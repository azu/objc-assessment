//
//  propertyTests.m
//  objc-assessment
//
//  Created by azu on 07/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "propertyTests.h"
#import "objc/runtime.h"

@implementation propertyTests {
}

/*HERE*/

- (void)setUp {
    [super setUp];
    // プロパティに値を追加する
    /* HERE */
}


// インスタンス変数 _myArray を定義する
- (void)testHasInstanceVar {
    NSArray *instances = [self instanceVarNames];
    // _myArray という名前のインスタンス変数を持つ
    assertThat(instances, hasItem(@"_myArray"));
}

// property(myArray = _myArray)を定義する
- (void)testHasProperty {
    NSDictionary *properties = [self properties];
    // myFooという名前のNSArray型のプロパティが存在する
    assertThat(properties, hasEntry(@"myArray", @"NSArray"));
}

// propertyに値を追加する
- (void)testPropertyValue {
    // self.myArrayは@"foo"という値のitemを持ってる
    if ([self respondsToSelector:@selector(myArray)]){
        assertThat([self performSelector:@selector(myArray)], hasItem(@"foo"));
        assertThat([self valueForKey:@"_myArray"], hasItem(@"foo"));// インスタンス変数の方にも

    } else {
        STFail(@"myArrayプロパティが存在しません");
    }
}
#pragma mark - Test Support Method
// http://d.hatena.ne.jp/shu223/20120226/1330231240
static const char *getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@'){
            return (const char *) [[NSData dataWithBytes:(attribute + 1) length:strlen(attribute) - 1] bytes];
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2){
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@'){
            return (const char *) [[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "";
}
// http://stackoverflow.com/questions/1440974/outputting-ivars-from-description-method
- (NSArray *)instanceVarNames {
    unsigned int varCount;
    Ivar *vars = class_copyIvarList([self class], &varCount);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ;i < varCount ;i++){
        Ivar var = vars[i];

        const char *name = ivar_getName(var);
        const char *typeEncoding = ivar_getTypeEncoding(var);
        [arr addObject:[NSString stringWithCString:name encoding:NSUTF8StringEncoding]];
        // do what you wish with the name and type here
    }
    free(vars);
    return arr;
}

- (NSArray *)propertyNames {
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (i = 0 ;i < outCount ;i++){
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName){
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            [arr addObject:propertyName];
        }
    }
    free(properties);

    return arr;
}

- (NSDictionary *)properties {
    unsigned int outCount, i;
    objc_property_t *props = class_copyPropertyList([self class], &outCount);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    for (i = 0 ;i < outCount ;i++){
        objc_property_t property = props[i];
        const char *propName = property_getName(property);
        if (propName){
            const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            NSString *propertyType = [NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
            [dic setObject:propertyType forKey:propertyName];
        }
    }
    free(props);

    return dic;
}

@end
