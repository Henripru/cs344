"""
Name: Henri Prudhomme
Class: CS344

Problem Specifications: 
    Initial state: Wolf and Sheep are on spot 1
    Goal: Move Wolf and Sheep to spot 2
    Actions: 
        1. Wolf kills Sheep and then moves to spot 2. 
        2. Move Sheep to spot 2 after which Wolf chases and moves to spot 2.

Solution: Move sheep to spot 2, Wolf follows and ends up at spot 2. Puzzle solved.

Why GPS fails: Gps tries to achieve goal of moving Wolf to spot 2, but ends up killing sheep.
    Then there is no sheep left alive, so the Gps program breaks.

How to make things work: Swap goals so that 'Sheep is on spot 2' is the first goal
"""
from gps import gps

# Formulate the problem states and actions.
problem = {
    'initial': ['Wolf is on spot 1', 'Sheep is on spot 1'],
    'goal': ['Wolf is on spot 2', 'Sheep is on spot 2'],

    'actions': [
        {
            'action': 'Wolf eats sheep and moved from spot 1 to spot 2',
            'preconds': [
                'Wolf is on spot 1',
                'Sheep is on spot 1'
            ],
            'add': [
                'Wolf is on spot 2',
            ],
            'delete': [
                'Sheep is on spot 1',
                'Wolf is on spot 1'
            ]
        },
        {
            'action': 'Sheep is moved from spot 1 to spot 2',
            'preconds': [
                'Wolf is on spot 1',
                'Sheep is on spot 1'
            ],
            'add': [
                'Sheep is on spot 2',
                'Wolf is on spot 2'
            ],
            'delete': [
                'Sheep is on spot 1',
                'Wolf is on spot 1'
            ]
        }
    ]
}

if __name__ == '__main__':
    print('Solution to part a.')
    # Use GPS to solve the problem formulated above.
    actionSequence = gps(
        problem['initial'],
        problem['goal'],
        problem['actions']
    )

    # Print the solution, if there is one.
    if actionSequence is not None:
        for action in actionSequence:
            print(action)
    else:
        print('plan failure...')