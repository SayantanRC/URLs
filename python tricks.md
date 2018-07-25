## Python tricks for competitive coding

### Convert to `int`, `float`
`int()` or `float()`

### Convert to string
`str()`

### Split a string to characters
`list("Hello")`

### Add to, remove from list
```
n = []
n.append(3)
n.append(4)
n.pop(0) ## index position
n.remove(4) ## actual value
```

### Accept list of comma separated integers
```
n = [int(i) for i in input().split(',')]
```

### Split a number into corresponding digits
```
arr = [int(i) for i in list(str(24869453))]
```

### Remove duplicates from list
`l = list(set(l))`

### Find max of a list below a maximum limit
```
max([i for i in m if i <= 2])    ## finds max number of list m below 2
```

### Use global variable
```
def fun1():
  global s
  s = "Hello"
  
def fun2():
  print(s)
```

### Convert decimal number to any other base
```
def findToBase(num, base):

	if num == 0:
		return 0

	if num < base:
		r = num
	else:
		r = num % base

	return int(str(findToBase(int(num/base), base)) + str(r))
  ```
