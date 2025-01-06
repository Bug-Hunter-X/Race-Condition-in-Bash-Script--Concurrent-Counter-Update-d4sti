# Race Condition in Bash Script

This repository demonstrates a common race condition bug in shell scripting.  Two processes concurrently increment a shared counter, resulting in an inaccurate final count due to the lack of proper synchronization mechanisms. The solution introduces a mutex (using a lock file) to prevent this race condition.