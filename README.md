# Data_Analaysis_Internship
# Dataset Cleaning Task

## Overview
This project involves cleaning and preparing a raw dataset containing information about individuals with missing values and inconsistent formatting. The goal is to transform the raw data into a clean, analysis-ready dataset.

## Dataset Description
The original dataset (`sample_missing_values.csv`) contains:
- 10 records with 5 columns: Name, Age, Gender, City, Score
- Various missing values (NaNs) in all columns except Name
- One misaligned record due to empty Name field
- Inconsistent formatting in text fields

## Cleaning Steps Performed

1. **Fixed Data Alignment**:
   - Corrected the misaligned record where 'Eve' appeared in the Age column

2. **Handled Missing Values**:
   - Age: Filled with median value (26.5 → rounded to 26/27)
   - Gender: Filled with most frequent value (Male)
   - City: Filled with 'Unknown'
   - Score: Filled with average value (80.5)

3. **Standardized Formats**:
   - Converted Gender to lowercase
   - Capitalized City names consistently
   - Renamed columns to lowercase with underscores

4. **Data Type Correction**:
   - Converted Age to integer type
   - Maintained Score as float type

5. **Verified No Duplicates**:
   - Checked for and confirmed no duplicate records exist

## Usage
The cleaning script (`clean_data.py`):
1. Loads the raw CSV file
2. Performs all cleaning operations
3. Outputs the cleaned dataset
4. Can be modified for different datasets with similar issues

## Requirements
- Python 3.x
- Pandas library
- NumPy library

## Output
The cleaned dataset is now:
- Complete (no missing values)
- Consistent (standardized formats)
- Properly typed (correct data types)
- Ready for analysis
