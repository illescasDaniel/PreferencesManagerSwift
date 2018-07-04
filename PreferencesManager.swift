import Foundation

#if swift(>=4.2)
@dynamicMemberLookup
#endif
class PreferencesManager {
	
	enum Properties: String {
		case username
		case password
		// ...
	}
	
	static let shared = PreferencesManager()
	private static let defaults = UserDefaults.standard
	
	fileprivate init() { }
	
	subscript<T>(property: Properties, default defaultvalue: T) -> T {
		get {
			switch defaultvalue {
			case is Int:
				return (PreferencesManager.defaults.integer(forKey: property.rawValue) as? T) ?? defaultvalue
			case is String:
				return (PreferencesManager.defaults.string(forKey: property.rawValue) as? T) ?? defaultvalue
			case is Double:
				return (PreferencesManager.defaults.double(forKey: property.rawValue) as? T) ?? defaultvalue
			case is Float:
				return (PreferencesManager.defaults.float(forKey: property.rawValue) as? T) ?? defaultvalue
			case is Bool:
				return (PreferencesManager.defaults.bool(forKey: property.rawValue) as? T) ?? defaultvalue
			case is URL:
				return (PreferencesManager.defaults.url(forKey: property.rawValue) as? T) ?? defaultvalue
			case is Data:
				return (PreferencesManager.defaults.data(forKey: property.rawValue) as? T) ?? defaultvalue
			case is [String]:
				return (PreferencesManager.defaults.stringArray(forKey: property.rawValue) as? T) ?? defaultvalue
			case is [Any]:
				return (PreferencesManager.defaults.array(forKey: property.rawValue) as? T) ?? defaultvalue
			case is [String: Any?]:
				return (PreferencesManager.defaults.dictionary(forKey: property.rawValue) as? T) ?? defaultvalue
			default:
				return (PreferencesManager.defaults.object(forKey: property.rawValue) as? T) ?? defaultvalue
			}
		}
	}
	
	#if swift(>=4.2)
	subscript<T>(property: Properties) -> T? {
		get { return self[dynamicMember: property.rawValue] }
		set { self[dynamicMember: property.rawValue] = newValue }
	}
	
	subscript<T>(dynamicMember propertyKey: String) -> T? {
		get { return PreferencesManager.defaults.object(forKey: propertyKey) as? T }
		set { PreferencesManager.defaults.set(newValue, forKey: propertyKey) }
	}
	#else
	subscript<T>(property: Properties) -> T? {
		get { return PreferencesManager.defaults.object(forKey: property.rawValue) as? T }
		set { PreferencesManager.defaults.set(newValue, forKey: property.rawValue) }
	}
	#endif
	
	func set(_ values: [Properties: Any]) {
		values.forEach { self[$0.key] = $0.value }
	}
	
	func remove(property: Properties) {
		PreferencesManager.defaults.removeObject(forKey: property.rawValue)
	}
}

