import Cocoa
import CoreServices
import UniformTypeIdentifiers

class ResetFolderHandler {
    static func main() {
        // Finder's bundle identifier
        let finderBundleId = "com.apple.finder"
        
        print("Attempting to set Finder as the default handler for folders...")
        
        do {
            // Set Finder as the default handler for public.folder
            try LSSetDefaultRoleHandlerForContentType("public.folder" as CFString, .all, finderBundleId as CFString)
            print("Successfully set Finder as the default handler for folders!")
            
            // Also set it for com.apple.folder which is sometimes used
            try LSSetDefaultRoleHandlerForContentType("com.apple.folder" as CFString, .all, finderBundleId as CFString)
            print("Also set Finder as handler for com.apple.folder")
            
            print("\nAll done! Folders should now open in Finder again.")
        } catch {
            print("Error: Failed to set Finder as the default handler")
            print("Error details: \(error.localizedDescription)")
        }
    }
}

// Run the main function
ResetFolderHandler.main()
