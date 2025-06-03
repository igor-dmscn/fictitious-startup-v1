resource "aws_budgets_budget" "cost" {
  name = "aws_budget"

  budget_type  = "COST"
  limit_amount = "5"
  limit_unit   = "USD"

  time_period_start = "2025-01-01_00:00"
  time_period_end   = "2027-12-31_23:59"
  time_unit         = "MONTHLY"
}
