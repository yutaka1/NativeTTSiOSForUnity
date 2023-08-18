//staticLibrary.hファイルの内容
#import <Foundation/Foundation.h>

@interface staticLibrary : NSObject
// ログに"Hello World"と出力して2を返す。
// NOTE: ここではクラスメソッド(静的関数)として実装
+ (int32_t)SpeakMessage;

@end
// 2019.3からはこちらをimportする必要がある
#import <UnityFramework/UnityFramework-Swift.h>

// MARK:- extern "C" (Cリンケージで宣言)
extern "C" {
    // NOTE: この関数が実際にUnity(C#)から呼び出される
    int32_t SpeakMessage(const char *message) {
    
         // 上記で宣言・実装した`Example.printHelloWorld`を呼び出す。呼び出し時の構文はObjC形式となる。
         // NOTE: クラスメソッド(静的関数)として実装しているので、クラスをインスタンス化せずに直接呼び出せる
         return [staticLibrary_swift SpeakMessageWithMessage:@(message)];
    }
}
