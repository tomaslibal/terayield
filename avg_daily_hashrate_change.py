"""
    Calculates the average daily rate of change for the
    Bitcoin network hashrate.

    Prints the data in a chart.
"""

import matplotlib.pyplot as plt
import numpy as np

with open("hashrate.csv", "r") as f:
    content = f.read().split('\n')
    prev = float(content[0])
    values = []
    for line in content:
        try:
            diff = (float(line) / prev) - 1
            values.append(diff)
            prev = float(line)
        except ValueError:
            pass
    # print(values)
    average = np.average(values)
    print("average value = {}".format(average))
    plt.plot(values)
    plt.axhline(average, color='red')
    plt.show()



