//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Amin faruq on 10/10/22.
//

import Foundation

public final class ImageCommentsPresenter {
    public static var title: String {
        NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
                          tableName: "ImageComments",
                          bundle: Bundle(for: Self.self),
                          comment: "Title for image comments view")
    }
}
