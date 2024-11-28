import Cocoa
import CoreServices
import UniformTypeIdentifiers

class ListFileHandlers {
    static func main() {
        // Common development file extensions to check
        let extensionsToCheck = [
            "tsx", "jsx", "ts", "js", "py", "rb", "php", "java", "cpp", "c", "h", "hpp",
            "go", "rs", "swift", "kt", "cs", "css", "scss", "html", "htm", "xml", "yaml",
            "yml", "json", "md", "markdown", "txt", "sh", "bash", "zsh", "conf", "toml",
            "ini", "cfg", "gradle", "properties", "sql", "graphql", "proto", "vue", "svelte"
        ]
        
        var checkedExtensions = Set<String>()
        var fileAssociations = [(ext: String, handler: String)]()
        
        for ext in extensionsToCheck {
            if checkedExtensions.contains(ext) { continue }
            checkedExtensions.insert(ext)
            
            if let uti = UTType(filenameExtension: ext)?.identifier {
                if let handler = LSCopyDefaultRoleHandlerForContentType(uti as CFString, .all)?.takeRetainedValue() as String? {
                    fileAssociations.append((ext: ext, handler: handler))
                }
            }
        }
        
        print("\nFile extensions and their current handlers:")
        print("=========================================")
        
        // Sort by extension
        fileAssociations.sort { $0.ext < $1.ext }
        
        for (ext, handler) in fileAssociations {
            print(".\(ext)")
            print("  Current handler: \(handler)\n")
        }
        
        print("\nTotal file extensions checked: \(fileAssociations.count)")
    }
}

// Run the main function
ListFileHandlers.main()
