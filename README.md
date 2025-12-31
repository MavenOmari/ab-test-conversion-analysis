## Project Overview
This project analyzes the results of an A/B test conducted to evaluate whether a product change improved user conversion.

## Business Question
Did the treatment group convert at a higher rate than the control group?

## Dataset
User-level experiment data containing:
- experiment_group (control vs treatment)
- converted (1 = converted, 0 = not converted)

## Methodology
- Aggregated users by experiment group
- Calculated conversion rates for control and treatment
- Measured conversion lift to support a rollout decision

## Key Findings
- Control conversion rate: X%
- Treatment conversion rate: Y%
- Observed lift: Z%

## Recommendation
Based on the observed lift, the analysis suggests the treatment performed better than the control and should be considered for rollout pending further validation.

## Next Steps
- Statistical significance testing
- Segment-level performance analysis
- Longer experiment duration
