import matplotlib.pyplot as plt
import numpy as np

t1 = np.linspace(0, 0.002, 200, endpoint=False)
vC1 = 1.25e6 * t1**2

t2 = np.linspace(0.002, 0.004, 200, endpoint=False)
vC2 = 5000 * t2 - 5

t3 = np.linspace(0.004, 0.006, 200, endpoint=False)
vC3 = -1.25e6 * t3**2 + (10**4) * t3 +13

t4 = np.linspace(0.006,0.008, 200)
vC4 = -5000 * t4 + 58

plt.figure(figsize=(10, 5))
plt.plot(t1, vC1, color='blue', label='0 ≤ t < 2 ms')
plt.plot(t2, vC2, color='green', label='2 ≤ t < 4 ms')
plt.plot(t3, vC3, color='orange', label='4 ≤ t < 6 ms')
plt.plot(t4, vC4, color='red', label='6 ≤ t ≤ 8 ms')

plt.axhline(0, color='black', linewidth=1.2)
plt.axvline(0, color='black', linewidth=1.2)

plt.xlim(0, 0.01)
plt.ylim(-11, 50)
plt.xlabel('Tiempo [s]')
plt.ylabel('Voltaje [V]')
plt.title('Voltaje en el capacitor $v_C(t)$')
plt.legend()
plt.tight_layout()
plt.savefig("ejercicio1VC.png")

