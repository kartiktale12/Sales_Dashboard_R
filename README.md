# 📊 Sales Dashboard using R Shiny

An interactive Sales Dashboard built using **R Shiny**, **ggplot2**, and **Forecasting techniques**. This application allows users to filter sales data, visualize trends, analyze seasonality, and generate future sales predictions.

---

## 🚀 Features

✅ Filter sales data by category  
✅ Select custom date ranges  
✅ View sales trends over time  
✅ Analyze monthly seasonality  
✅ Forecast future sales using ARIMA  
✅ Interactive dashboard using Shiny  

---

## 🛠 Technologies Used

- R
- Shiny
- ggplot2
- dplyr
- readr
- forecast

---

## 📂 Project Structure

```text
Sales-Dashboard/
│
├── app.R
├── full_sales_dataset.csv
├── README.md
```

---

## 📦 Required Packages

Install required packages before running:

```r
install.packages(c(
"shiny",
"ggplot2",
"dplyr",
"readr",
"forecast"
))
```

---

## ▶️ How to Run

### Clone repository

```bash
git clone https://github.com/yourusername/Sales-Dashboard.git
```

### Open project in RStudio

Open:

```text
app.R
```

Run:

```r
shiny::runApp()
```

---

## 📊 Dataset Format

Your CSV file should contain:

| Column | Type |
|----------|--------|
| Date | Date |
| Category | Text |
| Sales | Numeric |

Example:

```csv
Date,Category,Sales
2026-01-01,Electronics,5000
2026-01-02,Furniture,3500
2026-01-03,Electronics,4500
```

---

## 📈 Dashboard Components

### Sales Trend
Displays line chart of sales over time.

### Monthly Seasonality
Shows monthly total sales using bar charts.

### Sales Forecast
Uses ARIMA model to predict upcoming sales.

---

## 🔮 Forecast Method

The forecasting module uses:

- Time Series conversion
- ARIMA model
- Forecast package
- Future prediction horizon = 8 periods

---

## 📸 Preview

Add screenshots here:

```text
screenshots/dashboard.png
```

---

## 👨‍💻 Author

Kartik

---

## ⭐ Future Improvements

- Download reports
- More chart types
- KPI cards
- Multiple category selection
- Database connectivity

---

If you like this project, give it a ⭐ on GitHub.
