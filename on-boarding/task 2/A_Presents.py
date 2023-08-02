def present(li):
    from collections import defaultdict
    dicti=defaultdict(int)
    for i in range(1,len(li)+1):
        dicti[li[i-1]]=i
    dicti1=dict(sorted(dicti.items(),key=lambda x:x[0]))
    for i in list(dicti1.values()):
        print(i,end=" ")
size=int(input())
arr=list(map(int,input().split()))
present(arr)