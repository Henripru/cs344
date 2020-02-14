"""
Name: Henri Prudhomme
Date: Feb 14, 2020
Class: CS 344
Lab: 02
"""
from search import Problem, hill_climbing, simulated_annealing, \
    exp_schedule, genetic_search
from random import randrange
import math

class SinVariant(Problem):
    """
    State: x value for the sin function variant f(x)
    Move: a new x value delta steps from the current x (in both directions) 
    """
    
    def __init__(self, initial, maximum=30.0, delta=0.001):
        self.initial = initial
        self.maximum = maximum
        self.delta = delta
        
    def actions(self, state):
        return [(state + self.delta) if (state + self.delta <= self.maximum) else (self.maximum), (state - self.delta) if (state + self.delta >= 0) else 0]
    
    def result(self, stateIgnored, x):
        return x
    
    def value(self, x):
        return math.fabs(x * math.sin( x ))


if __name__ == '__main__':

    # Formulate a problem with a 2D hill function and a single maximum value.
    numSearches = 1000
    maximum = 30
    hsSum = 0
    saSum = 0
    hsBest = 0
    saBest = 0

    # add random restart by running numSearches times and saving the best and average values
    for x in range(0, numSearches):
        initial = randrange(0, maximum)
        p = SinVariant(initial, maximum, delta=1.0)

        # Solve the problem using hill-climbing.
        hill_solution = hill_climbing(p)

        # Solve the problem using simulated annealing.
        annealing_solution = simulated_annealing(
            p,
            exp_schedule(k=20, lam=0.005, limit=1000)
        )
        
        # save current values
        hsResult = p.value(hill_solution) 
        saResult = p.value(annealing_solution)

        # save if best values
        if(hsResult > hsBest):
            hsBest = hsResult
        if(saResult > saBest):
            saBest = saResult

        # add values to running averages
        hsSum += hsResult
        saSum += saResult
    
    # print results
    print('Hill-climbing best solution: ' + str(hsBest))
    print('Simulated annealing best solution: ' +  str(saBest))
    print('Hill-climbing solution average: ' + str(hsSum/numSearches) )
    print('Simulated annealing solution average: ' +  str(saSum/numSearches))

