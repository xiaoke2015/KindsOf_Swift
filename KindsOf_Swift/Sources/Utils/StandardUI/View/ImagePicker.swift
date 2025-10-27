//
//  ImagePicker.swift
//  FoundationUI
//
//  Created by 李加建 on 2021/4/29.
//

import Photos
import UIKit

extension PHPhotoLibrary {
    static func requestAccess(complete: @escaping (_ granted: Bool) -> Void) {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        complete(true)
                    default:
                        complete(false)
                    }
                }
            }
        } else {
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        complete(true)
                    default:
                        complete(false)
                    }
                }
            }
        }
    }
}

public class ImagePicker {
    private var picker: ObjcImagePicker = .init()
    public init(delegate: ImagePickerDeleagte?) {
        picker.delegate = delegate
    }

    public func present(in viewController: UIViewController) {
        picker.pickerController.modalPresentationStyle = .fullScreen
        viewController.present(picker.pickerController, animated: true, completion: nil)
    }

    public func present(camera viewController: UIViewController) {
        PHPhotoLibrary.requestAccess { granted in
            if granted {
                self.picker.pickerController.modalPresentationStyle = .fullScreen
                self.picker.pickerController.sourceType = .camera
                self.picker.pickerController.allowsEditing = false
                viewController.present(self.picker.pickerController, animated: true, completion: nil)
            }
        }
    }

    public func present(library viewController: UIViewController) {
        PHPhotoLibrary.requestAccess { granted in
            if granted {
                self.picker.pickerController.modalPresentationStyle = .fullScreen
                self.picker.pickerController.sourceType = .photoLibrary
                self.picker.pickerController.allowsEditing = false
                viewController.present(self.picker.pickerController, animated: true, completion: nil)
            }
        }
    }
}

public protocol ImagePickerDeleagte: AnyObject {
    func didFinishPicking(image: UIImage)
}

private class ObjcImagePicker: NSObject {
    override init() {}

    weak var delegate: ImagePickerDeleagte?

    lazy var pickerController: UIImagePickerController = {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image"]
        return pickerController
    }()
}

extension ObjcImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String
        if mediaType == "public.image" {
            var image: UIImage?
            image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            if image == nil {
                image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            }
            if let img = image {
                delegate?.didFinishPicking(image: img)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
