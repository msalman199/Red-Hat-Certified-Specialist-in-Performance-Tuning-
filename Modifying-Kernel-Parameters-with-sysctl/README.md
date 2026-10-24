<div align="center">

# 🎛️ Kernel Parameter Tuning & Role-Based Profiles with sysctl

### Inspect, Modify, Persist, and Validate Kernel Settings for Real Workloads

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![sysctl](https://img.shields.io/badge/sysctl-Kernel_Tuning-333333?style=for-the-badge&logo=linux&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Performance](https://img.shields.io/badge/Performance-Tuning-orange?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-yellow?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [📖 Lab Overview](#-lab-overview)
- [🧪 Lab Environment](#-lab-environment)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [📚 Further Reading](#-further-reading)
- [🚀 Next Steps](#-next-steps)
- [✅ Conclusion](#-conclusion)

---

## 📖 Lab Overview

In this lab, students used **`sysctl`** to inspect, modify, and persist kernel parameters governing **virtual memory behavior**, **network stack performance**, and **file system limits**, then built **role-based tuning profiles** for web server and database workloads.

---

## 🧪 Lab Environment

> 💡 **Lab Environment**
> A Linux system where `sysctl` is used to view and change kernel parameters, with validated settings persisted under `/etc/sysctl.d/`.

---

## 🏆 Key Accomplishments

### 1️⃣ 🔍 Inspecting, Modifying, and Persisting Parameters
- ✅ Used `sysctl` to inspect and modify kernel parameters
- ✅ Covered three areas: **virtual memory behavior**, **network stack performance**, and **file system limits**
- ✅ Persisted settings by writing validated configuration into `/etc/sysctl.d/`

### 2️⃣ 🖥️ Role-Based Tuning Profiles
- ✅ Built tuning profiles for specific workloads:

| 🏷️ Profile | 🎯 Workload |
|-----------|------------|
| 🌐 Web Server | Web server tuning profile |
| 🗄️ Database | Database tuning profile |

### 3️⃣ 🧪 Safe Tuning Practices
- ✅ Captured baselines before making changes
- ✅ Used backup scripts and validation logs
- ✅ Reinforced measuring and testing every change in a **non-production environment** before wider rollout

---

## 🧠 Key Concepts

| 🔑 Concept | 📘 Description |
|-----------|----------------|
| **`sysctl`** | 🎛️ Command for inspecting and modifying kernel parameters |
| **Runtime vs. Persistent Changes** | ⏱️ Runtime changes are immediate but volatile; persistent settings must be written into `/etc/sysctl.d/` to survive a reboot |
| **`/etc/sysctl.d/`** | 💾 Location for validated, persistent kernel parameter configuration |
| **Baseline Capture** | 📏 Recording current values before tuning |
| **Backup Scripts & Validation Logs** | 🗂️ Safeguards that support measured, testable changes |
| **Workload-Dependent Tuning** | 🎯 The "correct" value for parameters like `vm.swappiness` or `vm.dirty_ratio` depends heavily on workload type |
| **Role-Based Tuning Profile** | 🖥️ A parameter set tailored to a role such as web server or database |

---

## 🌍 Real-World Applications

- 🏭 **Production tuning** requires writing validated configuration into `/etc/sysctl.d/` so settings survive a reboot
- 🧪 **Safe rollouts** — measure and test kernel tuning changes in a non-production environment before rolling them out broadly
- 🎯 **Workload-specific tuning** — web servers and database servers need different parameter values

---

## 📚 Further Reading

| 📖 Resource | 📌 Where to Find It |
|------------|---------------------|
| `sysctl(8)` | Man page |
| `sysctl.d(5)` | Man page |
| Kernel sysctl documentation | `Documentation/admin-guide/sysctl/` in the Linux kernel source tree |
| Vendor performance tuning guides | Published by Red Hat and Canonical |

---

## 🚀 Next Steps

Students now have a repeatable toolkit for exploring further tuning areas such as:

- 📦 **cgroup-based resource limits**
- 🧭 **`numa` balancing parameters**
- 🔐 **Kernel-level security hardening**

---

## ✅ Conclusion

The exercises demonstrated that parameter changes made at runtime are immediate but volatile, and that real production tuning requires writing validated configuration into `/etc/sysctl.d/` so settings survive a reboot. The emphasis on baseline capture, backup scripts, and validation logs reinforced why any kernel tuning change should be measured and tested before being rolled out broadly.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al_Nafi-Cybersecurity_Education-0A66C2?style=for-the-badge)

**Made with ❤️ for Al Nafi learners**

</div>
