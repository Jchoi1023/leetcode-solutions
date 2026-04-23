class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        res = {}
        for i, k in enumerate(nums):
            diff = target - i
            if diff in res:
                return res[diff], i
            res[i] = k
