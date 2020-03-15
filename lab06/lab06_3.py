# Henri Prudhomme

from keras.datasets import boston_housing
(x_train, y_train), (x_test, y_test) = boston_housing.load_data()

print("6.3ai")
print("Num training examples " + str(len(x_train)))
print("Num testing examples " + str(len(x_test)))

print("6.3aii")

print('training examples dimensions:' x_train.ndim, x_train.shape, x_train.dtype)

print('testing examples dimensions:' x_test.ndim, x_test.shape, x_test.dtype)
