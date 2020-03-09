'''
Henri Prudhomme
CS344 - Lab05

Exercise 5.2
'''
from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

#Create Bayes network
cancer = BayesNet([
    ('Cancer', '', 0.01),
    ('T1', 'Cancer', {T: 0.90, F: 0.20}),
    ('T2', 'Cancer', {T: 0.90, F: 0.20})
    ])

# 5.2 a
print('5.2 a')
print(enumeration_ask('Cancer', dict(T1 = T, T2 = T), cancer).show_approx())

# the result that T = 0.17 makes sense because although both tests have a high chance of detecting cancer the overall probability of cancer presence is 0.1 so i would expect the T value to be lower even after we are given that we had two positive tests.

# 5.2 b
print('5.2 b')
print(enumeration_ask('Cancer', dict(T1 = T, T2 = F), cancer).show_approx())

# the result that T = 0.00565 makes sense because the 2 conflicting tests would imply to me that one of them had false alarmed, but they are very good at detecting cancer, so I would expect the T value to be low (which it was).