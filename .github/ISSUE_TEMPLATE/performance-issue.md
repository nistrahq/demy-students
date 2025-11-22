---
name: Performance Issue
about: Report and track performance problems in the iOS app
title: "[Perf] - "
labels: performance
assignees: ""
---

## Scenario
Describe **when and where** the performance issue occurs.  
Examples:
- Lag when navigating between SwiftUI screens
- Slow list scrolling in a Feature module
- Freeze when ViewModel loads data
- Large memory spikes after switching tabs

## Baseline Metrics
Describe what was observed:
- FPS drops (e.g., from 120 → 30)
- Long ViewModel processing time
- High memory usage shown in Xcode Memory Graph
- Slow startup time
- Janky animations or blocked UI

If available, attach exact values.

## Expected Performance
What is the acceptable or target performance?  
Examples:
- “Scrolling should remain at 60 FPS”
- “Screen transition should occur under 300 ms”
- “Memory usage should not exceed X MB after loading Feature/Home”

## Steps to Reproduce
1. Launch the app  
2. Navigate to `Feature/...`  
3. Perform action: “...”  
4. Observe slowdown / freeze / stutters  

## Profiling / Traces
Attach any profiling data:  
- Xcode Instruments (Time Profiler, Memory Graph, Allocations, SwiftUI metrics)  
- Console logs  
- Screenshots of Instruments  
- Performance measurements from Debug view  

## Hypothesis / Plan
If possible, add ideas on potential root causes or areas to investigate:
- Inefficient SwiftUI view body recomposition  
- Heavy work on main thread  
- Networking or JSON decoding blocking UI  
- Retain cycles causing memory bloat  
- ViewModel transformations too expensive  

(Optional) Suggest next steps or optimizations.

