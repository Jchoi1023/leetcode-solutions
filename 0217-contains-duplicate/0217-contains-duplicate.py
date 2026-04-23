class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        lis = set()
        for i in nums:
            if i in lis:
                return True
            else:
                lis.add(i)
        return False