# Transform Requirements to Spec

Generate a spec file from the current requirement gathering session.

## Instructions:

1. Read requirements/.current-requirement
2. If no active requirement:
    - Show "No active requirement to transform"
    - Exit

3. Show current status:
    - If you have extracted previously spec [ID]
    ```
    📋 Active Requirement: [ID]-[name]

    Starting spec generation...
    ```
    - Else, ask user to specify spec ID
    ```
    📋 Active Requirement: [name]

    What is the spec ID?
    ```
    Then continue
    ```
    📋 Active Requirement: [ID]-[name]

    Starting spec generation...
    ```

4. Read 06-requirements-spec.md and transform it to spec file with following formatting:
```
# Spec: [ID]-[name]

**Last Updated**: YYYY-MM-DD  
**Status**: 🚧 Planning | ⏳ In Progress | ✅ Complete  
**Tags**: `#feature`, `#pattern`, `#tech`  

## Overview

Summarize the feature and its purpose.
What and why in 2-3 sentences.

## Business Context

- Domain problem being solved (use domain speak, avoid technical jargon)
- Technical constraints and requirements

## Requirements

**Files to Create/Modify:**

List files to be created/modified.
- Follow modular current project structure
- Exact file paths with purpose and established pattern reference

**Functionality:**

- Core business requirements
- Technical implementation details

## Implementation Plan

### Foundation Setup

- [ ] Database/models …

### Core Development

- [ ] Service layer …
- [ ] API endpoints …

### Integration & Testing

- [ ] Frontend components …
- [ ] Tests

## Definition of Done

- [ ] All files created/updated
- [ ] Tests passing (service + integration)
- [ ] Feature working end-to-end
- [ ] Follows established patterns

## Implementation Notes

Track decisions and pattern deviations as you work.

## AI Workflow

**1. Before Starting:**

- Search for existing specs/tests.
- If found: Read context. Then proceed with implementing existing spec
- If none: ask clarifying questions, then create new spec
  Ask clarifying questions. Do not start coding until all questions are answered. Write down Q&A in spec

**2. While Working:**

- Update **Last Updated** and **Status**
- Check off **Implementation Plan** items
- Document decisions in **Implementation Notes**

**3. Pattern Discovery:**

- Search by tag: `grep -r "#ai-upload" (specs|tests)/`
- Read other referenced specs: `cat specs/[ID]-<slug>.md`

## Implementation Decision Guidelines

**Follow Patterns**: Use established patterns unless there's a compelling business reason to deviate
**Document Deviations**: Always explain why you're departing from standard patterns
**Preserve History**: Use write-only approaches for pricing/financial data
**Maintain Backwards Compatibility**: Ensure existing features continue working
**Performance Considerations**: Index database queries, paginate large datasets

## Bootstrap (Empty Specs Folder)

If no specs exist:

1. Create first spec following template above
2. Use generic tags until patterns emerge
3. Document new patterns as they develop
```
- Store current spec file in specs/[ID]-[name].md (if specs/ folder missing create it)
