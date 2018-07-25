## Python tricks for competitive coding

### Convert to `int`, `float`
`int()` or `float()`

### Convert to string
`str()`

### Split a string to characters
`list("Hello")`

### Add to list
```
n = []
n.append(3)
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
