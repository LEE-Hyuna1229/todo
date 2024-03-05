


# 정수 num1과 num2가 주어질 때, num1에서 num2를 뺀 값을 return하도록 soltuion 함수를 완성해주세요.

# 제한 사항
# -50000 ≤ num1 ≤ 50000
# -50000 ≤ num2 ≤ 50000

# solution.py
def solution(num1, num2):
    if -50000<=num1<=50000 and -50000<=num2<=50000:
        answer = num1 - num2
        return answer