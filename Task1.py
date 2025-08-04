import pandas as pd
import numpy as np

# Load the data
df = pd.read_csv('sample_missing_values.csv')

# Fill missing values
df['Name'] = df['Name'].fillna('Eve')  # Correcting the missing name
median_age = df['Age'].median()
df['Age'] = df['Age'].fillna(median_age).astype(int)  # Fill with median and convert to int
mode_gender = df['Gender'].mode()[0]
df['Gender'] = df['Gender'].fillna(mode_gender).str.lower()  # Fill with mode and standardize
df['City'] = df['City'].fillna('Unknown').str.title()  # Fill missing cities and standardize
mean_score = df['Score'].mean()
df['Score'] = df['Score'].fillna(mean_score)  # Fill with mean score

# Standardize column names
df.columns = df.columns.str.lower()

# Display cleaned dataset
print(df.to_string(index=False))
