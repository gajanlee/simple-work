import numpy as np

# w1 = [
#     [1, 0, 1], 
#     [1, 0, 0], 
#     [0, 0, 0], 
#     [1, 1, 0],
# ]

# w2 = [
#     [1, 1, 1],
#     [0, 0, 1],
#     [0, 1, 1],
#     [0, 1, 0],
# ]

w1 = [
    [0, 0],
    [2, 0],
    [2, 2],
    [0, 2],
]

w2 = [
    [4, 4],
    [6, 4],
    [6, 6],
    [4, 6],
]

w1 = np.matrix(w1)
w2 = np.matrix(w2)

m1 = np.mean(w1, axis=0)
m2 = np.mean(w2, axis=0) 

N = w1.shape[0]
cov1 = (w1 - m1).T * (w1 - m1) / N
cov2 = (w2 - m2).T * (w2 - m2) / N

if np.equal(cov1, cov2).all():
    coff = ((m1 - m2) * cov1.I).A.reshape(-1, )
    bias = (-1/2*m1*cov1.I*m1.T + 1/2*m2*cov2.I*m2.T).A.reshape(-1, )[0]
    res = "".join(["+{}x{}".format(n, i) if n >= 0 else "{}x{}".format(n, i) for i, n in enumerate(coff)])[:] + ("+"+str(bias) if bias >= 0 else str(bias)) + "=0"
    print(res)

    from matplotlib import pyplot as plt
    plt.scatter(w1[:, 0].A.reshape(-1, ), w1[:, 1].A.reshape(-1, ), c="r")
    plt.scatter(w2[:, 0].A.reshape(-1, ), w2[:, 1].A.reshape(-1, ), c="g")
    x = np.linspace(-2, 8, 1000)
    plt.plot(x, 6-x)
    plt.show()
