<div align="center">

# 🐝 eBPF Kernel Tracing: System Calls, DNS Latency & Performance Reporting

### Observing Live Kernel Activity with `syscount` and `gethostlatency`

![eBPF](https://img.shields.io/badge/eBPF-Kernel%20Tracing-orange?style=for-the-badge&logo=linux&logoColor=white)
![BCC](https://img.shields.io/badge/BCC-Tools-blue?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-Parsing-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [📖 Overview](#-overview)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [📚 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🚀 Next Steps](#-next-steps)
- [✅ Conclusion](#-conclusion)

---

## 📖 Overview

In this lab, students used eBPF-based tracing tools, `syscount` and `gethostlatency`, to observe live kernel-level activity, including system call frequency and DNS resolution latency, without modifying or recompiling any application code.

| 🎯 Focus Area | 📝 Description |
|--------------|----------------|
| **System Call Tracing** | Observing system call frequency with `syscount` |
| **DNS Latency Tracing** | Measuring DNS resolution latency with `gethostlatency` |
| **Log Capture & Parsing** | Capturing raw eBPF trace output to log files and parsing it with Python |
| **Issue Detection** | Highlighting excessive I/O system calls and slow DNS lookups |
| **Performance Reporting** | Merging both data sources into one severity-ranked JSON report |

---

## 🏆 Key Accomplishments

### 🔍 1. Live Kernel Observation
- ✅ Used `syscount` to observe system call frequency
- ✅ Used `gethostlatency` to observe DNS resolution latency
- ✅ Gathered all data without modifying or recompiling any application code

### 📄 2. Trace Capture & Parsing
- ✅ Captured raw eBPF trace output into log files
- ✅ Parsed the logs with Python
- ✅ Turned raw output into structured statistics

### ⚠️ 3. Concrete Issue Identification
- ✅ Highlighted excessive I/O system calls
- ✅ Highlighted slow DNS lookups

### 📊 4. Performance Report Generator
- ✅ Merged two independent data sources into a single JSON artifact
- ✅ Included severity-ranked issues
- ✅ Included prioritized recommendations

---

## 📚 Key Concepts

| 🔑 Concept | 📝 Description |
|-----------|----------------|
| **eBPF** | Kernel-level tracing technology that observes live activity without changing application code |
| **BCC Tools** | The collection of eBPF-based tracing utilities that includes `syscount` and `gethostlatency` |
| **`syscount`** | Reports system call frequency |
| **`gethostlatency`** | Reports DNS resolution latency |
| **Log Capture** | Saving raw trace output to files for later analysis |
| **Structured Statistics** | Parsed, summarized data derived from raw trace output |
| **Severity-Ranked Issues** | Findings ordered by how serious they are |
| **JSON Performance Report** | A single artifact combining both data sources with issues and recommendations |

---

## 🌍 Real-World Applications

| 🏢 Scenario | 💡 How This Lab Applies |
|------------|------------------------|
| **Production Incident Response** | The merged report pattern helps pinpoint issues during an incident |
| **Capacity Planning** | Structured statistics and prioritized recommendations inform resource decisions |
| **I/O Troubleshooting** | Excessive I/O system calls are surfaced from live kernel data |
| **DNS Troubleshooting** | Slow DNS lookups are identified without touching application code |

---

## 🚀 Next Steps

- 🧰 Explore additional BCC tools such as **`opensnoop`**, **`execsnoop`**, and **`biolatency`**
- ⏰ Integrate the reporting pipeline into a **scheduled monitoring job**
- 🐍 Experiment with writing **custom eBPF programs** using the `bcc` Python bindings to trace application-specific code paths

---

## ✅ Conclusion

This lab showed how eBPF tools can reveal live kernel-level behavior, including system call frequency and DNS resolution latency, with no changes to application code. You captured trace output into logs, parsed it with Python into structured statistics, and built a report generator that merges both sources into a single JSON artifact with severity-ranked issues and prioritized recommendations, a pattern directly applicable to production incident response and capacity planning.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-blueviolet?style=for-the-badge)

**Happy Tracing! 🐝**

</div>
