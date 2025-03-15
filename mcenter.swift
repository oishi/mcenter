#!/usr/bin/swift

import Foundation
import CoreGraphics

// Get a list of active displays
var displayCount: UInt32 = 0
CGGetActiveDisplayList(0, nil, &displayCount)

let maxDisplays: UInt32 = displayCount
var activeDisplays = [CGDirectDisplayID](repeating: 0, count: Int(maxDisplays))
CGGetActiveDisplayList(maxDisplays, &activeDisplays, &displayCount)

// Get the frame (position and size) of each display
var displayFrames: [(display: CGDirectDisplayID, frame: CGRect)] = []
for display in activeDisplays {
    let frame = CGDisplayBounds(display)
    displayFrames.append((display: display, frame: frame))
}

// Sort by physical position (x-axis) to find the middle display
// Note: For 3 displays, we assume the middle one in the sorted list is the center display
let sortedDisplays = displayFrames.sorted { $0.frame.midX < $1.frame.midX }
guard sortedDisplays.count > 0 else {
    print("No displays detected!")
    exit(1)
}

// Specify display index
// If there's only one display, use index 0 regardless of command line argument
// Otherwise, use the command line argument or default to the middle display
let displayIndex: Int
if sortedDisplays.count == 1 {
    displayIndex = 0
} else if CommandLine.arguments.count > 1, let index = Int(CommandLine.arguments[1]) {
    // Ensure the index is within bounds
    displayIndex = min(max(0, index), sortedDisplays.count - 1)
} else {
    // Default to middle display for multiple displays
    displayIndex = sortedDisplays.count > 2 ? 1 : 0
}
let displayFrame = sortedDisplays[displayIndex].frame

// Calculate center coordinates
let centerPoint = CGPoint(x: displayFrame.midX, y: displayFrame.midY)

// Move mouse cursor position
CGWarpMouseCursorPosition(centerPoint)
CGAssociateMouseAndMouseCursorPosition(1)

// print("moved cursor to center !!")
