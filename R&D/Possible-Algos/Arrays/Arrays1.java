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

    //Container with Most H2O
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

}