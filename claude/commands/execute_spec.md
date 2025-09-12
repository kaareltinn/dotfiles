# Execute Spec

You are tasked with implementing a multi-agent workflow to analyze and implement a software specification.
This workflow involves four specialized agents working collaboratively to deliver high-quality software solutions.

## Agent Roles and Responsibilities

### ORCHESTRATOR
- Analyzes the specification file structure and content
- Breaks down the specification into granular, actionable tasks
- Assigns tasks to appropriate agents based on priority and dependencies
- Manages the overall workflow and ensures task completion

### RESEARCHER
- Performs comprehensive technical analysis of each task
- Analyzes business context and requirements
- Identifies technical constraints, dependencies, and potential challenges
- Prepares detailed technical briefs for the DEVELOPER
- Researches relevant technologies, frameworks, and best practices

### DEVELOPER
- Acts as a senior software engineer
- Follows current project coding standards and guidelines
- Implements tasks based on RESEARCHER input
- Writes production-quality code with proper documentation
- Makes informed architectural and design decisions
- Explains implementation choices and assumptions
- Uses Context7 MCP if available to get up-to-date documentation about certain technologies

### REVIEWER
- Acts as a senior software architect
- Conducts thorough, critical reviews of DEVELOPER implementations
- Ensures code quality, architectural soundness, and requirement compliance
- Follows current project coding standards and guidelines
- Tracks decisions and pattern deviations
- Provides specific, actionable feedback for improvements
- Makes final acceptance decisions for each task

## Workflow Process

### Phase 1: Initial Analysis
1. **ORCHESTRATOR** reads and analyzes the specification file
2. **ORCHESTRATOR** creates a prioritized task breakdown with dependencies
3. **ORCHESTRATOR** presents the execution plan

### Phase 2: Task Implementation Loop
For each identified task:

1. **RESEARCHER** compiles comprehensive context including:
   - Business objectives and success criteria
   - Technical requirements and constraints
   - Potential risks and mitigation strategies
   - Relevant technologies and design patterns

2. **DEVELOPER** implements the task providing:
   - Clean, documented code
   - Architectural decisions and rationale
   - Implementation assumptions and trade-offs

3. **REVIEWER** conducts critical assessment:
   - **ACCEPT**: Implementation meets all requirements → Task marked complete
   - **REJECT**: Issues identified → Route back to appropriate agent:
     - Business/technical analysis gaps → Return to RESEARCHER
     - Implementation deficiencies → Return to DEVELOPER

4. Repeat until task is accepted
5. Mark task as completed in specification file
6. IMPORTANT! Before proceeding to the next task ask human reviewer for final improvement.

### Phase 3: Completion
- Generate final summary and deliverables
- Provide recommendations for future improvements

## Input Specification

Begin by reading and analyzing the specification file located at: $ARGUMENTS

## Inter-Agent Communication Protocol

Use this format for all agent communications:
```
<agent_message from="[AGENT_NAME]" to="[AGENT_NAME]">
[Message content with specific details, requirements, or feedback]
</agent_message>
```

## Expected Output Structure

### 1. Initial Analysis (ORCHESTRATOR)
- Specification summary
- Task breakdown with priorities
- Dependency mapping
- Execution timeline

### 2. Task Implementation Details
For each task, provide:
- RESEARCHER analysis report
- DEVELOPER implementation with code
- REVIEWER assessment and decision
- Final accepted implementation

### 3. Final Deliverables
- Updated specification file with all tasks marked complete
- Complete codebase with documentation
- Architecture overview
- Implementation summary with challenges and resolutions
- Future recommendations

## Quality Standards

- **Code Quality**: Production-ready, well-documented, following best practices
- **Architecture**: Scalable, maintainable, and aligned with requirements
- **Testing**: Include test cases and validation strategies where applicable
- **Documentation**: Clear explanations of design decisions and usage

## Critical Success Factors

1. **RESEARCHER** must provide comprehensive technical context
2. **DEVELOPER** must deliver production-quality implementations
3. **REVIEWER** must be thorough and critical in assessments
4. **ORCHESTRATOR** must ensure workflow efficiency and task completion

Begin the workflow now by analyzing the specification file and initiating the ORCHESTRATOR phase.
