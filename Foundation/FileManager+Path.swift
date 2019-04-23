//
// FileManager+Path.swift
// DaTracker
//
// Created by Pavel Kuzmin on 04.10.2018.
// Copyright © 2018 Gaika Group. All rights reserved.
//

import Foundation.NSFileManager

extension FileManager {
    /// URL for documents directory
    ///
    /// Returns `nil` if there is no access.
    /// - Returns: URL or nil
    func documentURL() -> URL? {
        guard let documentURL = self.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }

        return documentURL
    }

    func cachesURL() -> URL? {
        guard let cachesURL = self.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }

        return cachesURL
    }

    func fileSizeAtPath(path: String) -> Int64 {
        do {
            let fileAttributes = try attributesOfItem(atPath: path)
            let fileSizeNumber = fileAttributes[FileAttributeKey.size] as? NSNumber
            let fileSize = fileSizeNumber?.int64Value
            return fileSize!
        } catch {
            print("error reading filesize, NSFileManager extension fileSizeAtPath")
            return 0
        }
    }


    func sizeAtURL(_ url: URL) -> Int64 {
        var size : Int64 = 0

        if url.hasDirectoryPath {
            if let contentsNames = try? FileManager.default.contentsOfDirectory(atPath: url.path) {
                for contentName in contentsNames {
                    let contentURL = url.appendingPathComponent(contentName)

                    size += self.sizeAtURL(contentURL)
                }
            }
        }
        else {
            size += self.fileSizeAtPath(path: url.path)
        }

        return size
    }
}