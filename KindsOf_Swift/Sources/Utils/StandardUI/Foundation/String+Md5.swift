//
//  String+Md5.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/12/1.
//

import Foundation
import CommonCrypto
import CryptoKit

public extension String {
    @available(iOS, deprecated: 13.0, message: "CC_MD5 is deprecated, use SHA256 instead")
    func md5WithCommonCrypto() -> String {
        let str = cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)

        let hash = NSMutableString()

        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.deallocate()
        return hash as String
    }
    
    @available(iOS 13.0, *)
    func md5WithCryptoKit() -> String {
        guard let data = self.data(using: .utf8) else { return "" }
        
        // 方法1：使用 Insecure.MD5（专门为兼容性设计）
        let digest = Insecure.MD5.hash(data: data)
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
