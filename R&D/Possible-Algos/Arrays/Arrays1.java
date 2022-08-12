import java.util.*;

public class Arrays1 {

  public static void main (String[] args) {

  }


  //TWO SUM
  //O(n^2) brute force
  public int[] twoSum(int[] nums, int target) {
    for (int i = 0; i < nums.length; i++) {
        for (int j = i + 1; j < nums.length; j++) {
            if (nums[j] == target - nums[i]) {
                return new int[] { i, j };
            }
        }
    }
    // In case there is no solution, we'll just return null
    return null;
    }
    //O(n) Hash Map
    public int[] twoSums(int[] nums, int target) {
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

    //Number of Islands
    void dfs(char[][] grid, int r, int c) {
        int nr = grid.length;
        int nc = grid[0].length;
    
        if (r < 0 || c < 0 || r >= nr || c >= nc || grid[r][c] == '0') {
          return;
        }
    
        grid[r][c] = '0';
        dfs(grid, r - 1, c);
        dfs(grid, r + 1, c);
        dfs(grid, r, c - 1);
        dfs(grid, r, c + 1);
      }
    
      public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) {
          return 0;
        }
    
        int nr = grid.length;
        int nc = grid[0].length;
        int num_islands = 0;
        for (int r = 0; r < nr; ++r) {
          for (int c = 0; c < nc; ++c) {
            if (grid[r][c] == '1') {
              ++num_islands;
              dfs(grid, r, c);
            }
          }
        }
    
        return num_islands;
      }    
       

}