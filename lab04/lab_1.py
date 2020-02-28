'''
Henri Prudhomme
CS 344
Lab 04
4.1 code
Feb 28, 2020
'''

from probability import JointProbDist, enumerate_joint_ask

# The Joint Probability Distribution Fig. 13.3 (from AIMA Python)
P = JointProbDist(['Toothache', 'Cavity', 'Catch'])
T, F = True, False
P[T, T, T] = 0.108; P[T, T, F] = 0.012
P[F, T, T] = 0.072; P[F, T, F] = 0.008
P[T, F, T] = 0.016; P[T, F, F] = 0.064
P[F, F, T] = 0.144; P[F, F, F] = 0.576

#4.1b
ans1 = enumerate_joint_ask('Cavity',{'Catch': T}, P)
print("4.1b: P(Cavity|Catch) results\n", ans1.show_approx())

# The Joint Probability Distributino of flipping 2 coins
P2 = JointProbDist(['Coin1', 'Coin2'])
Heads, Tails = True, False
P2[Heads, Heads] = 0.25; P2[Heads, Tails] = 0.25
P2[Tails, Heads] = 0.25; P2[Tails, Tails] = 0.25

#4.1c
ans2 = enumerate_joint_ask('Coin1', {'Coin2': Heads}, P2)
print("4.1c: P(Coin1|Coin2 = Heads) results\n", ans2.show_approx())
