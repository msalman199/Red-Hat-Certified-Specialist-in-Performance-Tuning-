<div align="center">

# 📊 Monitoring CPU & Memory Performance with GNOME System Monitor

### Observe, Stress-Test, and Analyze Linux Resource Usage

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![GNOME](https://img.shields.io/badge/GNOME_System_Monitor-4A86CF?style=for-the-badge&logo=gnome&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Performance](https://img.shields.io/badge/Performance-Monitoring-orange?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-yellow?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [📖 Lab Overview](#-lab-overview)
- [🎯 Learning Objectives](#-learning-objectives)
- [🧪 Lab Environment](#-lab-environment)
- [🛠️ Tools Used](#️-tools-used)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🚀 Next Steps](#-next-steps)
- [✅ Conclusion](#-conclusion)

---

## 📖 Lab Overview

In this lab, students installed and configured **gnome-system-monitor** alongside complementary command-line tools to observe, stress-test, and analyze **CPU and memory performance** on a Linux system.

Through hands-on tasks, students built a baseline monitoring script, generated controlled CPU and memory load, correlated GUI graphs with process-level data, practiced process priority management, and finished by building an advanced logging and trend-analysis pipeline.

---

## 🎯 Learning Objectives

| # | 🎯 Objective |
|---|-------------|
| 1 | 🔍 Recognize performance bottlenecks on a Linux system |
| 2 | ⚖️ Distinguish normal from abnormal resource consumption |
| 3 | 🧭 Translate raw monitoring data into actionable optimization decisions |

---

## 🧪 Lab Environment

> 💡 **Lab Environment**
> A Linux system with **gnome-system-monitor** installed, plus the command-line tools `stress-ng`, `ps`, `top`, and `renice`, and Python for the bounded memory-leak simulation.

---

## 🛠️ Tools Used

| 🧰 Tool | 📌 Purpose in This Lab |
|--------|------------------------|
| `gnome-system-monitor` | 🖥️ GUI view of CPU and memory graphs |
| `stress-ng` | 🔥 Controlled CPU and memory load generation |
| Python (bounded memory-leak simulation) | 💾 Simulating gradual memory growth safely |
| `ps` | 📋 Process-level data for correlation with GUI graphs |
| `top` | 📈 Live process-level resource view |
| `renice` | 🎚️ Process priority management |
| Bash scripts | 📝 Baseline monitoring, performance reports, logging and trend analysis |

---

## 🏆 Key Accomplishments

### 1️⃣ 📏 Baseline Monitoring
- ✅ Installed and configured `gnome-system-monitor` alongside complementary CLI tools
- ✅ Built a **baseline monitoring script** to capture normal system behavior

### 2️⃣ 🔥 Controlled Load Generation
- ✅ Generated controlled CPU and memory load with `stress-ng`
- ✅ Simulated a memory leak with a **bounded Python script**

### 3️⃣ 🔗 Correlating GUI and CLI Data
- ✅ Correlated **GUI graphs** with process-level data using `ps` and `top`

### 4️⃣ 🎚️ Process Priority Management
- ✅ Practiced adjusting process priority with `renice`

### 5️⃣ 📄 Reporting and Trend Analysis
- ✅ Produced a comprehensive **timestamped performance report**
- ✅ Built an advanced **logging and trend-analysis pipeline** that computed **average, minimum, and peak** resource usage
- ✅ Flagged **threshold-based alerts** from the collected data

---

## 🧠 Key Concepts

| 🔑 Concept | 📘 Description |
|-----------|----------------|
| **Performance Bottleneck** | 🚧 A resource (such as CPU or memory) that limits overall system performance |
| **Baseline Monitoring** | 📏 Capturing normal resource usage to compare against later behavior |
| **Controlled Stress Testing** | 🔥 Generating predictable CPU/memory load with tools like `stress-ng` |
| **Bounded Memory-Leak Simulation** | 💾 A Python script that grows memory usage in a limited, safe way |
| **Process Priority (`renice`)** | 🎚️ Adjusting how the scheduler prioritizes a running process |
| **Timestamped Performance Report** | 🕒 A time-stamped snapshot of system resource state |
| **Trend Analysis** | 📊 Computing average, minimum, and peak usage over logged data |
| **Threshold-Based Alerting** | 🚨 Flagging resource usage that crosses defined limits |

---

## 🌍 Real-World Applications

- 🛡️ **Spotting abnormal consumption** — distinguishing normal load from runaway processes or leaks before they affect users
- ⚙️ **Optimization decisions** — turning raw monitoring data into concrete tuning actions
- 🎚️ **Priority management** — keeping critical workloads responsive by adjusting process priorities
- 🧾 **Operational reporting** — producing timestamped reports and trend summaries for capacity reviews
- 🚨 **Early warning** — threshold-based alerts that surface problems proactively

---

## 🚀 Next Steps

For further study, students are encouraged to:

- 🔔 **Extend the alerting logic** to send notifications (for example, via email or a messaging webhook)
- 📡 **Integrate the logging scripts** with a persistent time-series tool such as **Prometheus and Grafana**
- 🏗️ **Practice these same techniques** against real multi-process workloads such as a web server or database under load

---

## ✅ Conclusion

In this lab, students installed and configured `gnome-system-monitor` alongside complementary command-line tools to observe, stress-test, and analyze CPU and memory performance on a Linux system. Together, these exercises reinforced the core objectives of the lab: recognizing performance bottlenecks, distinguishing normal from abnormal resource consumption, and translating raw monitoring data into actionable optimization decisions.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al_Nafi-Cybersecurity_Education-0A66C2?style=for-the-badge)

**Made with ❤️ for Al Nafi learners**

</div>
