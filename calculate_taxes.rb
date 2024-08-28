class CalculatePayroll
  def initialize
    @payable_employees = {
      "Hannah"   => { income: 120000, status: "Head of household", federal_taxes: 0, owed: 0 },
      "Frank"    => { income: 75000, status: "Married filing jointly", federal_taxes: 0, owed: 0 },
      "Heinrich" => { income: 200000, status: "Single", federal_taxes: 0, owed: 0 },
      "Charlize" => { income: 750000, status: "Married filing separately", federal_taxes: 0, owed: 0 }
    }
    compute_federal_taxes
  end

  def compute_federal_taxes
    @payable_employees.each_pair do |_employee_id, payroll_obj|
      payroll_obj[:federal_taxes] = FederalTaxCalculator.new(payroll_obj).sum_marginal_taxes
    end
  end

  def process_owed_after_taxes
    @payable_employees.each_pair do |_employee_id, payroll_obj|
      payroll_obj[:owed] = payroll_obj[:income] - payroll_obj[:federal_taxes]
    end

    puts @payable_employees
  end
end

class FederalTaxCalculator
  #Source: https://www.nerdwallet.com/article/taxes/federal-income-tax-brackets
  US_FED_TAX_BRACKETS = {
    single:                    {
      0.1  => 0..11600,
      0.12 => 11601..47150,
      0.22 => 47151..100525,
      0.24 => 100526..191950,
      0.32 => 191951..243725,
      0.35 => 243726..609350,
      0.37 => 609351..Float::INFINITY
    },
    married_filing_jointly:    {
      0.1  => 0..23200,
      0.12 => 23201..94300,
      0.22 => 94301..201050,
      0.24 => 201051..383900,
      0.32 => 383901..487450,
      0.35 => 487451..731200,
      0.37 => 731201..Float::INFINITY
    },
    married_filing_separately: {
      0.1  => 0..11600,
      0.12 => 11601..47150,
      0.22 => 47151..100525,
      0.24 => 100526..191950,
      0.32 => 191951..243725,
      0.35 => 243726..365600,
      0.37 => 365601..Float::INFINITY
    },
    head_of_household:         {
      0.1  => 0..16550,
      0.12 => 16551..63100,
      0.22 => 63101..100500,
      0.24 => 100501..191950,
      0.32 => 191951..243700,
      0.35 => 243701..609350,
      0.37 => 609351..Float::INFINITY
    }
  }.freeze

  def initialize(record)
    @taxable_income = record.fetch(:income, 0)
    @filing_status  = record.fetch(:status, "single").downcase.split(" ").join("_").to_sym
  end

  def sum_marginal_taxes
    taxes_due.reduce(&:+)
  end

  def taxes_due
    US_FED_TAX_BRACKETS[@filing_status].map { |rate, bracket| apply_tax(rate, bracket) }
  end

  def apply_tax(rate, bracket)
    # Case 1: Total taxable income exceeds the bracket we are in
    # In this case, we want to tax the full bracket max of the taxable income
    # And we should remove this amount from the taxable income so that we do not double tax any amount
    amount_for_bracket = if @taxable_income > bracket.max
                           bracket_range = bracket.max - bracket.min
                           @taxable_income -= bracket_range
                           bracket_range
                         #  Case 2: We have taxed the full income and thus, should not apply further tax
                         # In this case, we return a 0 for the bracket
                         elsif @taxable_income <= 0
                           0
                         else
                           # Case 3: This is the final case, where we are at the top portion of the taxable income
                           # Which should naturally fall in the middle of the bracket we are in
                           # In this case, we need to do two things -- tax the full remaining income AND set that income
                           # To 0 for future bracket evaluations
                           stashed_income  = @taxable_income
                           @taxable_income = 0
                           stashed_income
                         end
    rate * amount_for_bracket
  end
end

payroll = CalculatePayroll.new
payroll.process_owed_after_taxes

# Questions:
# 1. Do we need to account fo filing status?
# 2. Does our tax calculator need to be able to receive the calendar year (since rates change)?
# 3. Are we limited to the united states for this calculator?
# 4. Even if a given company's payroll is small -- is it safe to assume MOST customers run payroll at roughly the same time each month?
