import Cocoa
import CoreServices
import UniformTypeIdentifiers

// Configure these variables for your needs
let sourceAppBundleId = "com.exafunction.windsurf"  // The app you want to change from
let targetAppBundleId = "com.sublimetext.4"         // The app you want to change to

class DefaultAppChanger {
    static func main() {
        // Get the path to target app
        guard let targetURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: targetAppBundleId) else {
            print("Error: Could not find app with bundle ID: \(targetAppBundleId)")
            return
        }
        
        // Get the path to source app
        guard let sourceURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: sourceAppBundleId) else {
            print("Error: Could not find app with bundle ID: \(sourceAppBundleId)")
            return
        }
        
        print("Found source app at: \(sourceURL.path)")
        print("Found target app at: \(targetURL.path)")
        
        // Common development file extensions to change
        let extensionsToChange = [
            "tsx", "jsx", "ts", "js", "py", "rb", "php", "java", "cpp", "c", "h", "hpp",
            "go", "rs", "swift", "kt", "cs", "css", "scss", "html", "htm", "xml", "yaml",
            "yml", "json", "md", "markdown", "txt", "sh", "bash", "zsh", "conf", "toml",
            "ini", "cfg", "gradle", "properties", "sql", "graphql", "proto", "vue", "svelte"
        ]
        
        var changedCount = 0
        var errorCount = 0
        
        for ext in extensionsToChange {
            if let uti = UTType(filenameExtension: ext)?.identifier {
                do {
                    try LSSetDefaultRoleHandlerForContentType(uti as CFString, .all, targetAppBundleId as CFString)
                    print("Changed default app for .\(ext) to \(targetAppBundleId)")
                    changedCount += 1
                } catch {
                    print("Failed to change default app for .\(ext): \(error.localizedDescription)")
                    errorCount += 1
                }
            } else {
                print("Could not get UTI for extension .\(ext)")
                errorCount += 1
            }
        }
        
        print("\nCompleted!")
        print("Successfully changed \(changedCount) file extensions from \(sourceAppBundleId) to \(targetAppBundleId)")
        if errorCount > 0 {
            print("Failed to change \(errorCount) file extensions")
        }
    }
}

// Run the main function
DefaultAppChanger.main()
