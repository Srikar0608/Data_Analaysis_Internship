# Simple Titanic EDA

import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load data
df = pd.read_excel("train.xlsx")

# 1. Basic Info
print(df.head())
print(df.info())
print(df.describe())
print(df.isnull().sum())

# 2. Value counts for categorical columns
print(df['Sex'].value_counts())
print(df['Embarked'].value_counts())

# 3. Histograms for numeric columns
df[['Age', 'Fare', 'SibSp', 'Parch']].hist(bins=20, figsize=(10,6))
plt.show()

# 4. Countplots for categorical columns
sns.countplot(x='Sex', data=df)
plt.show()

sns.countplot(x='Pclass', data=df)
plt.show()

# 5. Survival by category
sns.countplot(x='Sex', hue='Survived', data=df)
plt.show()

sns.countplot(x='Pclass', hue='Survived', data=df)
plt.show()

# 6. Boxplots for numeric vs survival
sns.boxplot(x='Survived', y='Age', data=df)
plt.show()

sns.boxplot(x='Survived', y='Fare', data=df)
plt.show()

# 7. Correlation heatmap
sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
plt.show()
