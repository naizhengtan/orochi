import numpy as np

n_post = 100
user = 500
guest = 5000
a = 1.53

count = 0
times = 0
with open('user_zipf', 'w') as f:
    while count < user:
        s = np.random.zipf(a)
        times = times + 1
        if s > n_post:
            continue
        count = count + 1
        f.write(str(s)+'\n')
print(times)

count = 0
times = 0
with open('guest_zipf', 'w') as f:
    while count < guest:
        s = np.random.zipf(a)
        times = times + 1
        if s > n_post:
            continue
        count = count + 1
        f.write(str(s)+'\n')
print(times)
