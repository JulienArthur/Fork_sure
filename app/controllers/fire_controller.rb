class FireController < ApplicationController
  def show
    @net_worth = Current.family.balance_sheet.net_worth_money
    
    # Calculate annual expenses based on last 12 months
    period_12m = Period.new(start_date: 12.months.ago.beginning_of_month.to_date, end_date: Date.current)
    expense_totals = Current.family.income_statement.expense_totals(period: period_12m)

    
    # Real total from the last 12 months (BigDecimal)
    total_expenses_12m = expense_totals.total
    
    # Simple logic: if history < 12 months, annualize the current average
    min_date = Current.family.transactions.visible.minimum("entries.date")
    months_with_data = [ min_date ? ((Date.current - min_date).to_i / 30.0).ceil : 0, 12 ].min

    
    @annual_expenses = if months_with_data > 0
      (total_expenses_12m / months_with_data) * 12
    else
      0
    end

    # FIRE Target (Rule of 25 / 4% SWR)
    @swr = Setting.fire_swr || 4.0
    @birth_year = Setting.fire_birth_year || 1991
    @retirement_age = Setting.fire_retirement_age || 65
    @retirement_year = @birth_year + @retirement_age

    @fire_target = @annual_expenses / (@swr / 100.0)
    
    @gap = [ @fire_target - @net_worth.amount, 0 ].max
    @progress_percentage = @fire_target > 0 ? ([ (@net_worth.amount / @fire_target) * 100, 100 ].min).to_f.round(1) : 0



    # Data for the projection chart (10 years)
    @projection_data = build_projection_data
    
    @breadcrumbs = [ [ "Home", root_path ], [ "FIRE", nil ] ]
  end

  def update
    Setting.fire_swr = params[:swr] if params[:swr].present?
    Setting.fire_birth_year = params[:birth_year] if params[:birth_year].present?
    Setting.fire_retirement_age = params[:retirement_age] if params[:retirement_age].present?
    redirect_to fire_path, notice: t(".updated")
  end

  private

  def build_projection_data
    # Simple projection: 5% return, 2% inflation (placeholder logic for visualization)
    raw_values = []
    current_nw = @net_worth.to_f
    current_exp = @annual_expenses.to_f
    
    (0..10).each do |year|
      raw_values << {
        date: year.years.from_now.to_date,
        value: Money.new(current_nw.round(2), Current.family.currency)
      }
      current_nw *= 1.05 # 5% growth
      # Note: fire_target can be calculated on the fly or added as another series if front allows
    end
    
    Series.from_raw_values(raw_values, interval: "1 year")
  end

end
