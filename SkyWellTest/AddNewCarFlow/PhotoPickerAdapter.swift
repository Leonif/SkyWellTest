//
//  PhotoPickerAdapter.swift
//  SkyWellTest
//
//  Created by Leonid Nifantyev on 8/5/18.
//  Copyright © 2018 LEONID NIFANTIJEV. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

enum PhotoPickerManagerError: Error {
    case denied
    case restricted
    case cancel
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .denied:
            return "error_user_denied_premission"
        case .restricted:
            return "error_user_restricted_permission"
        case .cancel:
            return "error_user_canceled_image_picking"
        case .unknown:
            return "error_unable_to_access_the_camera"
        }
    }
}

protocol PhotoPickerManagerDelegate: class {
    func photoPickerManager(_ photoPickerManager: PhotoPickerManager, didFailWith error: Error)
    func photoPickerManager(_ photoPickerManager: PhotoPickerManager, didFinishPickingPhoto photo: UIImage)
}

class PhotoPickerManager: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    weak var delegate: PhotoPickerManagerDelegate?
    private weak var viewControllerForImagePreview: UIViewController?
    
    override init() {
    }
    
    func showPhotoPickerView(in viewController: UIViewController, title: String? = nil, message: String? = nil) {
        
        self.viewControllerForImagePreview = viewController
        
        let btnGallery = UIAlertAction(title: "photo_picker_from_gallery", style: .default) { [weak self] (action) in
            self?.showGallery()
        }
        let btnCamera = UIAlertAction(title: "photo_picker_take_a_picture", style: .default) { [weak self] (action) in
            self?.showCamera()
        }
        let btnCancel = UIAlertAction(title: "cancel", style: .cancel) { [weak self] (action) in
            self?.onCancel()
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(btnGallery)
        alertController.addAction(btnCamera)
        alertController.addAction(btnCancel)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    private func showGallery() {
        let authStatus = PHPhotoLibrary.authorizationStatus()
        switch authStatus {
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ [weak self] (status) in
                guard let `self` = self else { return }
                
                switch status {
                    
                case .notDetermined:
                    self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.unknown)
                    
                case .restricted:
                    self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.restricted)
                    
                case .denied:
                    self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.denied)
                    
                case .authorized:
                    self.showImagePicker(for: .photoLibrary)
                }
            })
            
        case .restricted:
            self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.restricted)
            
        case .denied:
            self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.denied)
            
        case .authorized:
            self.showImagePicker(for: .photoLibrary)
        }
    }
    
    private func showCamera() {
        let authStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authStatus {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { [weak self] (granted) in
                guard let `self` = self else { return }
                if granted {
                    self.showImagePicker(for: .camera)
                }
                else {
                    self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.denied)
                }
            })
            
        case .restricted:
            self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.restricted)
            
        case .denied:
            self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.denied)
            
        case .authorized:
            self.showImagePicker(for: .camera)
        }
    }
    
    private func showImagePicker(`for` mediaType: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isCameraDeviceAvailable(.rear) && mediaType == .camera || mediaType != .camera {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = mediaType == .camera ? .fullScreen : .popover
            imagePicker.sourceType = mediaType
            imagePicker.delegate = self
            if mediaType == .camera {
                imagePicker.showsCameraControls = true
            }
            self.viewControllerForImagePreview?.present(imagePicker, animated: true, completion: nil)
        }
        else {
            self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.unknown)
        }
    }
    
    private func onCancel() {
        self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.cancel)
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.delegate?.photoPickerManager(self, didFinishPickingPhoto: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.delegate?.photoPickerManager(self, didFailWith: PhotoPickerManagerError.cancel)
        picker.dismiss(animated: true, completion: nil)
    }
    
}

