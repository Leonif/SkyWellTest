//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 5 images.
  struct image {
    /// Image `005-sunny`.
    static let sunny = Rswift.ImageResource(bundle: R.hostingBundle, name: "005-sunny")
    /// Image `006-sun`.
    static let sun = Rswift.ImageResource(bundle: R.hostingBundle, name: "006-sun")
    /// Image `007-clouds`.
    static let clouds = Rswift.ImageResource(bundle: R.hostingBundle, name: "007-clouds")
    /// Image `car_placeholder`.
    static let car_placeholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "car_placeholder")
    /// Image `weather_back`.
    static let weather_back = Rswift.ImageResource(bundle: R.hostingBundle, name: "weather_back")
    
    /// `UIImage(named: "005-sunny", bundle: ..., traitCollection: ...)`
    static func sunny(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sunny, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "006-sun", bundle: ..., traitCollection: ...)`
    static func sun(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sun, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "007-clouds", bundle: ..., traitCollection: ...)`
    static func clouds(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.clouds, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "car_placeholder", bundle: ..., traitCollection: ...)`
    static func car_placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.car_placeholder, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "weather_back", bundle: ..., traitCollection: ...)`
    static func weather_back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.weather_back, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `CarCell`.
    static let carCell = _R.nib._CarCell()
    /// Nib `WeatherView`.
    static let weatherView = _R.nib._WeatherView()
    
    /// `UINib(name: "CarCell", in: bundle)`
    static func carCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.carCell)
    }
    
    /// `UINib(name: "WeatherView", in: bundle)`
    static func weatherView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.weatherView)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `cell`.
    static let cell: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "cell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _WeatherView.validate()
      try _CarCell.validate()
    }
    
    struct _CarCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "CarCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> CarCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CarCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "car_placeholder", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'car_placeholder' is used in nib 'CarCell', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _WeatherView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "WeatherView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> WeatherView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? WeatherView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "005-sunny", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '005-sunny' is used in nib 'WeatherView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "weather_back", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'weather_back' is used in nib 'WeatherView', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = CarListVC
      
      let addNewCarScreenVC = StoryboardViewControllerResource<AddNewCarScreenVC>(identifier: "AddNewCarScreenVC")
      let bundle = R.hostingBundle
      let carInfoVC = StoryboardViewControllerResource<CarInfoVC>(identifier: "CarInfoVC")
      let carListVC = StoryboardViewControllerResource<CarListVC>(identifier: "CarListVC")
      let name = "Main"
      
      func addNewCarScreenVC(_: Void = ()) -> AddNewCarScreenVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addNewCarScreenVC)
      }
      
      func carInfoVC(_: Void = ()) -> CarInfoVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: carInfoVC)
      }
      
      func carListVC(_: Void = ()) -> CarListVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: carListVC)
      }
      
      static func validate() throws {
        if _R.storyboard.main().carListVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'carListVC' could not be loaded from storyboard 'Main' as 'CarListVC'.") }
        if _R.storyboard.main().addNewCarScreenVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addNewCarScreenVC' could not be loaded from storyboard 'Main' as 'AddNewCarScreenVC'.") }
        if _R.storyboard.main().carInfoVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'carInfoVC' could not be loaded from storyboard 'Main' as 'CarInfoVC'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
