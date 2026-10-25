<div align="center">

# 🔬 SystemTap Kernel Tracing & Real-Time Performance Monitoring

### Live Kernel Probing, Latency Histograms, and Combined System Dashboards

![SystemTap](https://img.shields.io/badge/SystemTap-Kernel%20Tracing-blue?style=for-the-badge&logo=linux&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Kernel-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Performance](https://img.shields.io/badge/Performance-Tuning-green?style=for-the-badge)
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

In this lab you installed and validated **SystemTap** on a live kernel, then built a progression of scripts that moved from simple system call counting to latency histograms, error tracking, synthetic load generation, and a combined real-time dashboard.

| 🎯 Focus Area | 📝 Description |
|--------------|----------------|
| **Kernel Tracing** | Installing and validating SystemTap on a running kernel |
| **Probe Scripting** | Filtering probes by process and counting system calls |
| **Statistics** | Aggregating data with `@avg`, `@min`, `@max`, and `@hist_log` |
| **Real-Time Monitoring** | Timer-based counter resets for a rolling system view |
| **Workload Correlation** | Matching a controlled I/O workload to script-reported metrics |

---

## 🏆 Key Accomplishments

### 🛠️ 1. SystemTap Installation & Validation
- ✅ Installed SystemTap on a live kernel
- ✅ Validated that the environment could run probes successfully

### 📊 2. Progressive Script Development
- ✅ System call counting
- ✅ Latency histograms
- ✅ Error tracking
- ✅ Synthetic load generation
- ✅ Combined real-time dashboard

### 🎯 3. Probe Filtering & Data Aggregation
- ✅ Filtered probes by process
- ✅ Aggregated statistics into **global associative arrays**
- ✅ Used built-in statistical aggregates: `@avg`, `@min`, `@max`, and `@hist_log`

### ⏱️ 4. Rolling Views with Timers
- ✅ Reset counters on a timer to produce a rolling view of system behavior

### 🔗 5. Workload Correlation
- ✅ Correlated a controlled I/O workload with the metrics your scripts reported

---

## 📚 Key Concepts

| 🔑 Concept | 📝 Description |
|-----------|----------------|
| **SystemTap** | A Linux tracing framework for probing a live kernel and reporting on its behavior |
| **Probe** | A hook attached to a kernel event, such as a system call |
| **Process Filtering** | Restricting probes so only a chosen process is measured |
| **Global Associative Array** | A script-wide key/value store used to aggregate statistics |
| **`@avg` / `@min` / `@max`** | Built-in statistical aggregates for average, minimum, and maximum values |
| **`@hist_log`** | Built-in aggregate that produces a logarithmic histogram, e.g. for latency |
| **Timer-Based Reset** | Clearing counters on an interval to give a rolling view of behavior |
| **Tapset** | SystemTap library of higher-level abstractions that can replace raw probes |
| **`stap -x <pid>`** | Option to scope monitoring to a single running process |

---

## 🌍 Real-World Applications

| 🏢 Scenario | 💡 How This Lab Applies |
|------------|------------------------|
| **Production Kernel Troubleshooting** | Correlating a controlled workload with script-reported metrics is the same workflow used in production |
| **I/O Latency Analysis** | Histograms and min/max/avg aggregates reveal latency distribution |
| **Error Tracking** | Scripts that track failing system calls surface problems at the kernel level |
| **Live System Dashboards** | A combined rolling view shows system behavior in real time |

---

## 🚀 Next Steps

- 📦 Explore SystemTap's **`tapset` library** to reuse higher-level abstractions instead of raw probes
- 🎯 Experiment with **`stap -x <pid>`** to scope monitoring to a single running process
- ⚖️ Compare your findings against **`perf`** or **`bpftrace`** to understand the tradeoffs between the different Linux tracing frameworks

---

## ✅ Conclusion

This lab took you from installing SystemTap to building a full real-time monitoring dashboard. You filtered probes by process, aggregated statistics into global associative arrays, used `@avg`, `@min`, `@max`, and `@hist_log`, and reset counters on a timer for a rolling view. By correlating a controlled I/O workload with your scripts' metrics, you practiced the same workflow used in production kernel-level troubleshooting.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-blueviolet?style=for-the-badge)

**Happy Tracing! 🔬**

</div>
