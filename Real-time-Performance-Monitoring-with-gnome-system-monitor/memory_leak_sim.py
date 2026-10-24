#!/usr/bin/env python3
import time

def memory_leak_simulation(max_iterations=15):
    """Simulate a bounded memory leak by continuously allocating memory."""
    memory_hog = []
    iteration = 0

    print("Starting bounded memory leak simulation...")
    print(f"Will allocate memory for {max_iterations} iterations (~10MB each), then exit.")

    while iteration < max_iterations:
        chunk = 'x' * (10 * 1024 * 1024)
        memory_hog.append(chunk)
        iteration += 1
        print(f"Iteration {iteration}: Allocated ~{iteration * 10}MB total")
        time.sleep(1)

    print("Memory leak simulation finished.")
    print(f"Total allocated before exit: ~{iteration * 10}MB")

if __name__ == "__main__":
    memory_leak_simulation()
