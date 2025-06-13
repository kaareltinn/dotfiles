Look at the spec file: `$SPEC_FILE_PATH`

Execute the plan:
- For each subtask summon a coding subagent to implement it
- If coding agent is done then summon a testing subagent to test the new code
- If testing agent is done then summon a code review subagent to analyse and review the new code
    - If subtask completed successfully - no failing tests, linter errors and application working as expected - then mark the subtask as completed and continue to the next subtask and repeat the process.
    - If subtask fails try to fix until it succeeds.

Remember:
    - A new subtask or two may occur if something significant is discovered during the execution of the plan
    - For each subtask make sure to check corresponding checkbox in the spec as completed
    - After all subtasks are finished a final validation subagent will be summoned and then the overall task concluded with a report for me
