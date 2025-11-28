//
//  StoreKitManager.swift
//  TestKinds
//
//  Created by i-sens on 2025/11/26.
//

import StoreKit

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)
public class StoreKitManager {
    public init() {}
    
    func requestProduct(_ productIds: [String]) async throws -> [Product] {
        try await Product.products(for: Set.init(productIds))
    }
    
    func purchase(_ product: Product, uid: String) async throws -> Transaction {
        
        guard let uuid = UUID(uuidString: uid) else {
            throw NSError(domain: "", code: 0)
        }
        
        let appAccountToken = Product.PurchaseOption.appAccountToken(uuid)
        
        let result = try await product.purchase(options: [appAccountToken])
        
        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            
            transaction.id
            transaction.productID
            transaction.originalID
            transaction.purchaseDate
            transaction.jsonRepresentation.base64EncodedString()
            transaction.appAccountToken?.uuidString
            
//            Bundle.main.appStoreReceiptURL
            await transaction.finish()
            return transaction
        case .userCancelled:
            throw NSError(domain: "", code: 0)
        case .pending:
            throw NSError(domain: "", code: 0)
        default:
            throw NSError(domain: "", code: 0)
        }
    }
    
    /// 验证交易
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw NSError(domain: "", code: 0)
        case .verified(let safe):
            return safe
        }
    }
    
}
