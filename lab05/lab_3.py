'''
Henri Prudhomme
CS344 - Lab05

Exercise 5.3
'''
from probability import BayesNet, enumeration_ask, elimination_ask, gibbs_ask

# Utility variables
T, F = True, False

#Create Bayes network
happiness = BayesNet([
    ('Sunny', '', 0.70),
    ('Raise', '', 0.01),
    ('Happy', 'Sunny Raise', {(T, T): 1.0, (T, F): 0.70, (F, T): 0.9, (F, F): 0.1}),
    ])

# 5.3 a i
print('5.3 a i')
print(enumeration_ask('Raise', dict(Sunny = T), happiness).show_approx())

# As expected p(raise|sunny) = 0.1 because they are independent of each other.

# 5.3 a ii
print('5.3 a ii')
print(enumeration_ask('Raise', dict(Sunny = T, Happy = T), happiness).show_approx())

# The likelihood of your happiness coming from the sun being out is very high (.7) versus the likelihood that you got a raise(.01). So I'd usually expect a person to be happy because the sun is out rather than have gotten a raise. Thus the result that p(raise | happy ^ sunny) = 0.0142 makes sense. 

# 5.3 b i
print('5.3 b i')
print(enumeration_ask('Raise', dict(Happy = T), happiness).show_approx())

# again, the probability that you got a raise given that you are happy is very low with the same reasoning from 5.3aii, but additionally, we can see that the probability is slightly more than 0.1 from the probability of a raise because you are not sad, which means that there is a tiny bit more chance that you are happy from a raise.

# 5.3 b ii
print('5.3 b ii')
print(enumeration_ask('Raise', dict(Sunny = F, Happy = T), happiness).show_approx())

# the probability that you got a raise given that you are happy and it is not sunny is roughly 8%. This is smaller than I would expect since I would expect if you are happy and it is not sunny then you must have gotten a raise, because I dont know any other reason that you would be happy.