### Question
> 0부터 9까지의 숫자 중 일부가 들어있는 정수 배열 numbers가 매개변수로 주어집니다. numbers에서 찾을 수 없는 0부터 9까지의 숫자를 모두 찾아 더한 수를 return 하도록 solution 함수를 완성해주세요.


### Answer
```
def solution(numbers):
    apple=0
    for i in range(0,10):
        if i in numbers: apple += 0
        else: apple += i
    return apple
```