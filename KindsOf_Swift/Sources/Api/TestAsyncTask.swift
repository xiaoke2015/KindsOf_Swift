//
//  TestAsyncTask.swift
//  KindsOf_Swift
//
//  Created by i-sens on 2025/11/26.
//


class TestAsyncTask {
    @discardableResult
    static func run<T>(
        _ operation: @escaping @Sendable () async throws -> T,
        onSuccess: @MainActor @escaping (T) -> Void,
        onError: @MainActor @escaping (Error) -> Void = { _ in }
        ) -> Task<Void, Never> {
        
        return Task {
            do {
                let result = try await operation()
                await MainActor.run {
                    onSuccess(result)
                }
            } catch {
                await MainActor.run {
                    onError(error)
                }
            }
        }
    }
}
