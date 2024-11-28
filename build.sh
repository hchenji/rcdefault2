#!/bin/bash

echo "Building DefaultAppChanger..."
swiftc DefaultAppChanger.swift -o DefaultAppChanger
chmod +x DefaultAppChanger

echo -e "\nBuilding ListFileHandlers..."
swiftc ListFileHandlers.swift -o ListFileHandlers
chmod +x ListFileHandlers

echo -e "\nBuilding ResetFolderHandler..."
swiftc ResetFolderHandler.swift -o ResetFolderHandler
chmod +x ResetFolderHandler

echo -e "\nAll applications built successfully!"
echo "To use these utilities:"
echo "1. List current file associations:"
echo "   ./ListFileHandlers"
echo ""
echo "2. Change file associations:"
echo "   Edit the variables at the top of DefaultAppChanger.swift to set source and target apps"
echo "   Then run: sudo ./DefaultAppChanger"
echo ""
echo "3. Reset folders to Finder:"
echo "   sudo ./ResetFolderHandler"
