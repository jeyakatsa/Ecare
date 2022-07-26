import java.util.*;

public class Arrays1 {

  public static void main (String[] args) {

  }


  //TWO SUM
  //O(n) hash table solution
  public int[] twoSum(int[] nums, int target) {
    Map<Integer, Integer> map = new HashMap<>();
    for (int i = 0; i < nums.length; i++) {
        map.put(nums[i], i);
    }
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        if (map.containsKey(complement) && map.get(complement) != i) {
            return new int[] { i, map.get(complement) };
        }
    }
    // In case there is no solution, we'll just return null
    return null;
  }


  //Container with Most Water Algorithm
  public int maxArea(int[] height) {
    int maxarea = 0;
    int left = 0; 
    int right = height.length - 1;
    while (left < right) {
        int width = right - left;
        maxarea = Math.max(maxarea, Math.min(height[left], height[right]) * width);
        if (height[left] <= height[right]) {
            left++;
        } else {
            right--;
        }
    }
    return maxarea;
  }  

  //3 Sum
  public List<List<Integer>> threeSum(int[] nums) {
    Arrays.sort(nums);
    List<List<Integer>> res = new ArrayList<>();
    for (int i = 0; i < nums.length && nums[i] <= 0; ++i)
        if (i == 0 || nums[i - 1] != nums[i]) {
            twoSumII(nums, i, res);
        }
    return res;
  }
  void twoSumII(int[] nums, int i, List<List<Integer>> res) {
      int lo = i + 1, hi = nums.length - 1;
      while (lo < hi) {
          int sum = nums[i] + nums[lo] + nums[hi];
          if (sum < 0) {
              ++lo;
          } else if (sum > 0) {
              --hi;
          } else {
              res.add(Arrays.asList(nums[i], nums[lo++], nums[hi--]));
              while (lo < hi && nums[lo] == nums[lo - 1])
                  ++lo;
          }
      }
  }  

}