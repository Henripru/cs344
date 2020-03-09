'''
Henri Prudhomme
CS344 - Lab05

Exercise 5.1 and 5.4
'''
from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

# From AIMA code (probability.py) - Fig. 14.2 - burglary example
burglary = BayesNet([
    ('Burglary', '', 0.001),
    ('Earthquake', '', 0.002),
    ('Alarm', 'Burglary Earthquake', {(T, T): 0.95, (T, F): 0.94, (F, T): 0.29, (F, F): 0.001}),
    ('JohnCalls', 'Alarm', {T: 0.90, F: 0.05}),
    ('MaryCalls', 'Alarm', {T: 0.70, F: 0.01})
    ])

print("Exercise 5.1\n\n")

#P(Alarm | burglary ∧ ¬earthquake)
print('i. ')
print(enumeration_ask('Alarm', dict(Burglary = T, Earthquake = F), burglary).show_approx())

#P(John | burglary ∧ ¬earthquake)
print('ii. ')
print(enumeration_ask('JohnCalls', dict(Burglary = T, Earthquake = F), burglary).show_approx())

#P(Burglary | alarm)
print('iii. ')
print(enumeration_ask('Burglary', dict(Alarm = T), burglary).show_approx())

#P(Burglary | john ∧ mary)
print('iv. ')
print(enumeration_ask('Burglary', dict(JohnCalls = T, MaryCalls = T), burglary).show_approx())


#Exercise 5.4
print("Exercise 5.4\n\n")
print(enumeration_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
print(elimination_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())
print(gibbs_ask('Burglary', dict(JohnCalls=T, MaryCalls=T), burglary).show_approx())

#The results of the enumeration and elimination ask algorithms are exactly the same, but the gibbs ask algorithm is slightly off. This is because the unlike the other to algorithms, the gibbs sampling process "settles into a 'dynamic equilibrium' in which the long-run fraction of time spent in each state is exactly proportional to its posterior probability." This means that it acts more like a simulated annealing and may not get the exact answer, but can get very close.