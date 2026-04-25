class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        res = {}
        for i, k in enumerate(nums):
            diff = target - k
            if diff in res:
                return res[diff], i
            else:
                res[k] = i
        