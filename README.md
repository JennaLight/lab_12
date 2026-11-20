# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Jenna Light
Adrian Leven
## Summary
In this lab, we implemented two types of state machines that relied on one-hot and binary representations for the various states. 
## Lab Questions

### Compare and contrast One Hot and Binary encodings
The key difference between these two encoding types is the way that states are represented in memory by the D Flip-Flops that we use to store state. One Hot encoded state machines use individual bits to represent each state, with one state corresponding to one bit. Binary encoded state machines represent the states in a binary coded system, which ends up using a smaller number of flip flops. This is because we only need as many flip flops as there are necessary to represent the number of states in binary.
### Which method did your team find easier, and why?
We found the binary encoding system easier, simply because the necessary K-Maps are less complex and there are fewer of them. The implementation of both was relatively straightforward, so the Combinational Circuit was the main challenge for each implementation.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
In cases where size and cost are a main concern, Binary encoding systems are superior, as they use fewer components. On the other hand, in cases where the complexity of the actual layout is of key importance, we would use a One Hot system.
