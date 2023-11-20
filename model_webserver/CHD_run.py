import pandas as pd
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

df = pd.read_csv("ThaiTest.csv")
X = df.drop("TenYearCHD",axis=1).values
y = df["TenYearCHD"].values

X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.2, random_state=0)

model = LogisticRegression()

model.fit(X_train, y_train)

y_pred = model.predict(X_test)

p_data=[[1,63,3,0,0,1,0,0,1,129,75,25.47,90,120]]
probabilities = model.predict_proba(p_data)

probabilities_percent = probabilities * 100

accuracy = model.score(X_test, y_test)
print("Predicted probabilities (in percent):", probabilities_percent[0]) #class 0 1
print("You are more likely to have coronary heart disease(CHD) in tenyears with : ",probabilities_percent[0][1]," %")
print("Accuracy:", accuracy*100)
