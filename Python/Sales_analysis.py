import pandas as pd
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("../data/bikedekho_sales.csv")

# Convert date
df['order_date'] = pd.to_datetime(df['order_date'])
df['month'] = df['order_date'].dt.to_period("M")

# KPI Calculation
total_revenue = df['revenue'].sum()
total_profit = df['profit'].sum()
profit_margin = (total_profit / total_revenue) * 100

print("Total Revenue:", total_revenue)
print("Total Profit:", total_profit)
print("Profit Margin:", round(profit_margin,2), "%")

# Monthly Revenue Trend
monthly_revenue = df.groupby('month')['revenue'].sum()

plt.figure()
monthly_revenue.plot()
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.show()

# Top Cities
top_cities = df.groupby('city')['profit'].sum().sort_values(ascending=False).head(5)
print("Top 5 Cities by Profit")
print(top_cities)
